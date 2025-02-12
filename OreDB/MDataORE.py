import os, sys, smtplib
import pandas as pd
import sqlalchemy as sa
from datetime import date, datetime
import refinitiv.data as rd
import blpapi

env = "prod"
if os.path.dirname(os.path.abspath(__file__)).find("\Test") > 0 or os.path.dirname(os.path.abspath(__file__)).find("/Test") > 0:
    env = "test"

os.environ["RD_LIB_CONFIG_PATH"] = "." # needed for refinitiv.data to find refinitiv-data.config.json

queryMDataBasis = " FROM ORE.dbo.MdatMarketDataDefinitions m INNER JOIN ORE.dbo.MdatVendorDefinitions v ON v.TickerId=m.TickerId WHERE v.VendorTicker IS NOT NULL AND (v.VendorField1 IS NOT NULL OR v.VendorField2 IS NOT NULL)"
AssociationQuery = "SELECT m.QuoteId,v.VendorTicker,v.VendorField1,v.VendorField2" + queryMDataBasis

DBconn = 'mssql+pyodbc://someDBServerName/Marktdaten?driver=SQL+Server'
DBconnTest = 'mssql+pyodbc://someDBServerNameTest/Marktdaten?driver=SQL+Server'

def logmsg(msgtext,isErr = False):
    """standard log"""
    print(datetime.now().strftime("%Y-%m-%d %H:%M:%S") + ("\tERROR\t" if isErr else "\tINFO\t") + msgtext)

# override standard config with MDataORE.config
if os.path.isfile('MDataORE.config'):
	logmsg("found MDataORE.config, reading config from there")
	with open('MDataORE.config', 'r') as file:
		config = file.read()
	b = compile(config, 'MDataORE.config', 'exec')
	exec(b)

# get date parameter from commandline, if given
if len(sys.argv) > 1:
    try:
        datetime.strptime(sys.argv[1],"%Y%m%d")
    except Exception as err:
        print ("passed date " + sys.argv[1] + " is invalid: " + str(err))
        sys.exit(1)
    today = sys.argv[1] 
else:
    today = date.today().strftime("%Y%m%d")

def get_tickers_query(vendor, additionalRestriction):
    return f"SELECT distinct v.VendorTicker {queryMDataBasis} and v.VendorName = '{vendor}' {additionalRestriction}"

def get_fields_query(vendor, additionalRestriction):
    return f"SELECT distinct Field FROM (SELECT v.VendorField1 Field,v.VendorName,v.OverridesFieldId,v.OverridesValue {queryMDataBasis} UNION SELECT v.VendorField2,v.VendorName,v.OverridesFieldId,v.OverridesValue {queryMDataBasis}) t WHERE t.Field is not NULL and t.Field <> 'NA' and t.VendorName = '{vendor}' {additionalRestriction}"

def get_overrides_query(vendor):
    return f"SELECT DISTINCT OverridesFieldId, OverridesValue FROM ORE.dbo.MdatVendorDefinitions WHERE VendorName = '{vendor}'"

def get_reuters_data():
    RICs = pd.read_sql_query(get_tickers_query("REUTERS"), conn)["VendorTicker"].to_list()
    FIELDs = pd.read_sql_query(get_fields_query("REUTERS"), conn)["Field"].to_list()
    if not RICs:
        logmsg("no reuters instruments defined")
        return
    if not FIELDs:
        logmsg("no reuters fields defined")
        return
    logmsg("connecting to reuters (refiniv.data)")
    mdata = pd.DataFrame()
    try:
        rd.open_session()
        mdata = rd.get_data(universe=RICs,fields=FIELDs)
        rd.close_session()
    except Exception as err:
        logmsg("error connecting or querying from refiniv.data: " + str(err), True)
    return mdata

SERVICE_NAME = blpapi.Name("serviceName")
REASON = blpapi.Name("reason")
SECURITY = blpapi.Name("security")
FIELD_ID = blpapi.Name("fieldId")
SECURITIES = blpapi.Name("securities")
FIELDS = blpapi.Name("fields")
OVERRIDES = blpapi.Name("overrides")
VALUE = blpapi.Name("value")

def create_bbg_request(service, securities, fields, override):
    """creates a request for given securities and fields, possibly adding one override (being a dictionary with keys fieldId and value)"""
    request = service.createRequest("ReferenceDataRequest")
    securitiesElement = request.getElement(SECURITIES)

    for security in securities:
        securitiesElement.appendValue(security)

    fieldsElement = request.getElement(FIELDS)
    for field in fields:
        fieldsElement.appendValue(field)

    if str(override[0]) != 'None' and str(override[1]) != 'None':
        overridesElement = request.getElement(OVERRIDES)
        overrideElement = overridesElement.appendElement()
        overrideElement.setElement(FIELD_ID, override[0])
        overrideElement.setElement(VALUE, override[1])
    return request

def process_generic_bbgevent(event):
    """logs failure messages in the event and finishes if fatal"""
    eventType = event.eventType()
    for msg in event:
        messageType = msg.messageType()
        if eventType == blpapi.Event.SESSION_STATUS:
            if (
                messageType == blpapi.Names.SESSION_TERMINATED
                or messageType == blpapi.Names.SESSION_STARTUP_FAILURE
            ):
                logmsg("bloomberg session failed to start or terminated", True)
                return True
        elif eventType == blpapi.Event.SERVICE_STATUS:
            if messageType == blpapi.Names.SERVICE_OPEN_FAILURE:
                serviceName = msg.getElementAsString(SERVICE_NAME)
                logmsg(f"failed to open bloomberg service {serviceName}", True)
    return False

def wait_for_bbgresponse(session):
    """Waits for response after sending the request"""
    returned_data = {}
    done = False
    while not done:
        event = session.nextEvent()
        eventType = event.eventType()
        if eventType == blpapi.Event.PARTIAL_RESPONSE:
            for msg in event:
                returned_data = msg.toPy()
        elif eventType == blpapi.Event.RESPONSE:
            for msg in event:
                returned_data = msg.toPy()
            done = True
        elif eventType == blpapi.Event.REQUEST_STATUS:
            for msg in event:
                if msg.messageType == blpapi.Names.REQUEST_FAILURE:
                    reason = msg.getElement(REASON)
                    logmsg(f"bloomberg request failed: {reason}", True)
                    done = True
        else:
            done = process_generic_bbgevent(event)
    return returned_data

def process_bbgevents(session):
    while True:
        event = session.tryNextEvent()
        if event is None:
            break
        if process_generic_bbgevent(event):
            break

def get_bloomberg_data():
    overrides = pd.read_sql_query(get_overrides_query("BLOOMBERG"), conn).values.tolist()
    # resulting data returned here
    mdata = pd.DataFrame()
    # every override needs a separate request
    for override in overrides:
        additionalRestriction = ""
        if str(override[0]) != 'None' and str(override[1]) != 'None':
            additionalRestriction = f" AND OverridesFieldId = '{override[0]}' AND OverridesValue = '{override[1]}'"
        if str(override[0]) == 'None' and str(override[1]) != 'None' or str(override[0]) != 'None' and str(override[1]) == 'None':
            logmsg(f"inconsistent overrides given in database (override field and value need to be both NULL/None or both not NULL/None), override field: {str(override[0])}, override value: {str(override[1])}", True)

        securities_query = get_tickers_query("BLOOMBERG",additionalRestriction)
        fields_query = get_fields_query("BLOOMBERG",additionalRestriction)
        securities = pd.read_sql_query(securities_query, conn)["VendorTicker"].to_list()
        fields = pd.read_sql_query(fields_query, conn)["Field"].to_list()
        if not securities:
            logmsg(f"no bloomberg instruments defined with {securities_query}")
            continue
        if not fields:
            logmsg(f"no bloomberg fields defined with {fields_query}")
            continue

        session = blpapi.Session()
        try:
            if not session.start():
                process_bbgevents(session)
                logmsg("failed to start bloomberg API session", True)
                return
            if not session.openService("//blp/refdata"):
                process_bbgevents(session)
                return

            request = create_bbg_request(session.getService("//blp/refdata"), securities, fields, override)
            # logmsg(f"sending bloomberg request {request.getRequestId()}: {request}")
            session.sendRequest(request, None)
            returned_data = wait_for_bbgresponse(session)
            
            # convert returned dictionary to dataframe
            if "securityData" in returned_data:
                for data_entry in returned_data["securityData"]:
                    values = pd.DataFrame(data_entry["fieldData"], index=[0])
                    values['Instrument'] = data_entry["security"]
                    if mdata.empty:
                        mdata = values
                    else:
                        mdata = pd.concat([mdata, values])
                mdata = mdata.reset_index(drop=True)
            else:
                logmsg(f"no securityData in returned_data, error response: {(returned_data['responseError'] if 'responseError' in returned_data else 'no responseError in returned_data')}", True)
        except Exception as e:
            logmsg(f"exception in starting bloomberg session/open service/create request: {repr(e)}", True)
        finally:
            session.stop()
    return mdata



logmsg(f"start fetching ORE data for environment {env}, connection {DBconn}" + (f" and {DBconnTest}" if env != "test" else ""))
try:
    engine = sa.create_engine(DBconn)
except Exception as err:
    logmsg(f"error connecting to {DBconn}: " + str(err), True)
    sys.exit(1)    
# if we're not explicitly in test, then store data also to test
if env != "test":
    try:
        engineT = sa.create_engine(DBconnTest)
        connT = engineT.connect()
        connT.begin()
    except Exception as err:
        logmsg(f"error connecting to {DBconnTest}: " + str(err), True)
        sys.exit(1)

with engine.connect() as conn, conn.begin():
    try:
        Associations = pd.read_sql_query(AssociationQuery, conn)

        mdata = get_reuters_data()
        bbg_data = get_bloomberg_data()
        if mdata.empty:
            mdata = bbg_data
        else:
            mdata = pd.concat([mdata, bbg_data])

        if mdata.empty:
            logmsg("no data retrieved, exiting", True)
            sys.exit(1)

        # uncomment once to store data into pickle file
        # mdata.to_pickle("mdata.pkl")
        # uncomment to work with existing data
        # mdata = pd.read_pickle("mdata.pkl")
        logmsg("removing old data from ORE.dbo.MdatMarketData for QuoteDate " + today)
        deleteMD = "DELETE FROM ORE.dbo.MdatMarketData WHERE QuoteDate = '" + today + "' AND QuoteId in (SELECT QuoteId " + queryMDataBasis + ")"
        conn.execute(sa.text(deleteMD))
        if env != "test":
            connT.execute(sa.text(deleteMD))

        logmsg("store received values into ORE.dbo.MdatMarketData")
        for index, row in Associations.iterrows():
            if row['VendorField2'] != "NA":
                QValue = mdata.loc[mdata['Instrument']==row['VendorTicker']][row['VendorField1']].iloc[0] # iloc[0] damit tatsächlich nur der wert kommt
                # falls beide Felder gegeben sind, den mittelwert nehmen (zb Bid/Ask)
                if not pd.isna(row['VendorField2']):
                    QValue += mdata.loc[mdata['Instrument']==row['VendorTicker']][row['VendorField2']].iloc[0]
                    QValue /= 2

                if pd.isna(QValue):
                    logmsg("no value in ticker: " + str(row['VendorTicker']) + ", field " + str(row['VendorField1']) + " respectively " + str(row['VendorField2']) + ". if this persists, then set VendorField2 to 'NA'.", True)
                else:
                    conn.execute(sa.text("INSERT INTO ORE.dbo.MdatMarketData (QuoteId,QuoteDate,QuoteValue) values(:QuoteId,:QuoteDate,:QuoteValue)"),{'QuoteId':row['QuoteId'],'QuoteDate':today,'QuoteValue':QValue})
                    if env != "test":
                        connT.execute(sa.text("INSERT INTO ORE.dbo.MdatMarketData (QuoteId,QuoteDate,QuoteValue) values(:QuoteId,:QuoteDate,:QuoteValue)"),{'QuoteId':row['QuoteId'],'QuoteDate':today,'QuoteValue':QValue})

        logmsg("copy known missing (marked with NA) from previous day")
        insertNA = """INSERT INTO ORE.dbo.MdatMarketData 
                    SELECT QuoteId, '""" + today + """' QuoteDate, QuoteValue 
                    FROM ORE.dbo.MdatMarketData 
                    WHERE QuoteDate = (select dateadd(dd, case when datepart(dw, MAX(QuoteDate)) = 2 then - 3 else -1 end, MAX(QuoteDate)) FROM ORE.dbo.MdatMarketData) 
                    AND QuoteID in (SELECT QuoteId from ORE.dbo.MdatMarketDataDefinitions m INNER JOIN ORE.dbo.MdatVendorDefinitions v ON v.TickerId=m.TickerId WHERE v.VendorField2 = 'NA')"""
        conn.execute(sa.text(insertNA))
        if env != "test":
            connT.execute(sa.text(insertNA))
        logmsg("finished fetching ORE data for ORE")
    
    except Exception as err:
        logmsg("general error: " + str(err), True)
