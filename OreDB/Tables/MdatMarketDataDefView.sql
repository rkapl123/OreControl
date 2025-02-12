USE ORE;

CREATE VIEW MdatMarketDataDef
AS
select m.QuoteDate, m.QuoteId, d.Quote, m.QuoteValue
FROM MdatMarketData m 
INNER JOIN MdatMarketDataDefinitions d on m.QuoteID = d.QuoteID;

CREATE VIEW MdatFixingDataDef
AS
select f.FixingDate, f.IndexId, d.FixingIndex, f.IndexValue
FROM MdatFixingData f
INNER JOIN MdatFixingDataDefinitions d on f.IndexId = d.IndexId;
