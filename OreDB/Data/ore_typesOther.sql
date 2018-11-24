use ORE;

INSERT INTO TypesIndexName (value) VALUES ('AUD-BBSW');
INSERT INTO TypesIndexName (value) VALUES ('AUD-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('BRL-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('CAD-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('CAD-CORRA');
INSERT INTO TypesIndexName (value) VALUES ('CAD-CDOR');
INSERT INTO TypesIndexName (value) VALUES ('CAD-BA');
INSERT INTO TypesIndexName (value) VALUES ('CHF-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('CHF-TOIS');
INSERT INTO TypesIndexName (value) VALUES ('CHF-SARON');
INSERT INTO TypesIndexName (value) VALUES ('CLP-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('CNY-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('COP-IBR');
INSERT INTO TypesIndexName (value) VALUES ('CZK-PRIBOR');
INSERT INTO TypesIndexName (value) VALUES ('DKK-CIBOR');
INSERT INTO TypesIndexName (value) VALUES ('DKK-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('DKK-DKKOIS');
INSERT INTO TypesIndexName (value) VALUES ('EUR-EURIBOR');
INSERT INTO TypesIndexName (value) VALUES ('EUR-EURIB');
INSERT INTO TypesIndexName (value) VALUES ('EUR-EONIA');
INSERT INTO TypesIndexName (value) VALUES ('EUR-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('GBP-SONIA');
INSERT INTO TypesIndexName (value) VALUES ('GBP-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('HKD-HIBOR');
INSERT INTO TypesIndexName (value) VALUES ('HUF-BUBOR');
INSERT INTO TypesIndexName (value) VALUES ('IDR-IDRFIX');
INSERT INTO TypesIndexName (value) VALUES ('IDR-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('INR-MIFOR');
INSERT INTO TypesIndexName (value) VALUES ('INR-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('JPY-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('JPY-TIBOR');
INSERT INTO TypesIndexName (value) VALUES ('JPY-TONAR');
INSERT INTO TypesIndexName (value) VALUES ('KRW-KORIBOR');
INSERT INTO TypesIndexName (value) VALUES ('KRW-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('MYR-KLIBOR');
INSERT INTO TypesIndexName (value) VALUES ('MYR-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('NOK-NIBOR');
INSERT INTO TypesIndexName (value) VALUES ('MXN-TIIE');
INSERT INTO TypesIndexName (value) VALUES ('NZD-BKBM');
INSERT INTO TypesIndexName (value) VALUES ('PLN-WIBOR');
INSERT INTO TypesIndexName (value) VALUES ('PHP-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('PHP-PHIREF');
INSERT INTO TypesIndexName (value) VALUES ('RUB-MOSPRIME');
INSERT INTO TypesIndexName (value) VALUES ('SEK-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('SEK-STIBOR');
INSERT INTO TypesIndexName (value) VALUES ('SEK-SIOR');
INSERT INTO TypesIndexName (value) VALUES ('SGD-SIBOR');
INSERT INTO TypesIndexName (value) VALUES ('SGD-SOR');
INSERT INTO TypesIndexName (value) VALUES ('SKK-BRIBOR');
INSERT INTO TypesIndexName (value) VALUES ('THB-BIBOR');
INSERT INTO TypesIndexName (value) VALUES ('TWD-TAIBOR');
INSERT INTO TypesIndexName (value) VALUES ('TWD-GENERIC');
INSERT INTO TypesIndexName (value) VALUES ('USD-LIBOR');
INSERT INTO TypesIndexName (value) VALUES ('USD-FedFunds');
INSERT INTO TypesIndexName (value) VALUES ('ZAR-JIBAR');

INSERT INTO TypesIndexName
SELECT concat(t1.value,'-',t2.tenor)
  FROM TypesIndexName t1, (select '1M' tenor UNION select '3M' UNION select '6M' UNION select '9M' UNION select '12M' UNION select '28D') t2;

-- CMS Indexes: CCY-CMS-TENOR
INSERT INTO TypesIndexName
SELECT concat(t1.value,'-CMS-',t2.tenor)
  FROM TypesCurrencyCode t1, (select '1Y' tenor UNION select '2Y' UNION select '5Y' UNION select '10Y' UNION select '20Y' UNION select '30Y') t2;

-- generic Indexes: CCY-INDEX
INSERT INTO TypesIndexName
SELECT concat(t1.value,'-INDEX-',t2.tenor)
  FROM TypesCurrencyCode t1, (select '1M' tenor UNION select '3M' UNION select '6M' UNION select '9M' UNION select '12M') t2;
  
-- ZeroInflationIndexes
INSERT INTO TypesIndexName (value) VALUES ('EUHICP');
INSERT INTO TypesIndexName (value) VALUES ('EUHICPXT');
INSERT INTO TypesIndexName (value) VALUES ('FRHICP');
INSERT INTO TypesIndexName (value) VALUES ('UKRPI');
INSERT INTO TypesIndexName (value) VALUES ('USCPI');
INSERT INTO TypesIndexName (value) VALUES ('ZACPI');

-- FxIndexes: FX-TAG-CCY1-CCY2, ECB taken as tag here, add others if needed...
INSERT INTO TypesIndexName
SELECT concat('FX-ECB-',t1.value,'-',t2.value) currencypair
  FROM TypesCurrencyCode t1, TypesCurrencyCode t2
  WHERE t1.value <> t2.value AND (t1.value = 'EUR') AND t1.value not in ('ATS','BEF','DEM','ESP','FIM','FRF','GRD','ITL','IEP','LUF','NLG','PTE')
  ORDER BY currencypair;


-- create currencyPairs from currency Codes (BEFORE inserting 'default' !!!)
DELETE FROM TypescurrencyPair;

INSERT INTO TypesCurrencyPair
SELECT concat(t1.value,t2.value) currencypair
  FROM TypesCurrencyCode t1, TypesCurrencyCode t2
  WHERE t1.value <> t2.value
  ORDER BY currencypair;

-- create factors from currency pairs and currency Codes (BEFORE inserting 'default' !!!)
INSERT INTO TypesFactors
SELECT concat('IR:',t1.value)
  FROM TypesCurrencyCode t1
  ORDER BY value;

INSERT INTO TypesFactors
SELECT concat('FX:',t1.value,t2.value) currencypair
  FROM TypesCurrencyCode t1, TypesCurrencyCode t2
  WHERE t1.value <> t2.value
  ORDER BY currencypair;

INSERT INTO TypesFactors
SELECT concat('INF:',t1.value)
  FROM TypesIndexName t1
  WHERE t1.value not like '%-%'
  ORDER BY value;
  
-- other inserts into Types tables
INSERT INTO TypesCurrencyCode (value) VALUES ('default');
INSERT INTO TypesCurrencyPair (value) VALUES ('default');
-- this is ugly, but necessary for XML import (and multiple calendar choices). maybe in the future we get an relation between Typescalendar and TypesMulticalendar...
-- add calendar combinations as needed for XML import or selection...
INSERT Typescalendar (value) VALUES ('TARGET,US,UK');
INSERT Typescalendar (value) VALUES ('UK,US');
INSERT Typescalendar (value) VALUES ('UK,TARGET');
INSERT Typescalendar (value) VALUES ('ZUB,TARGET,UK');
INSERT Typescalendar (value) VALUES ('ZUB,US,UK');
INSERT Typescalendar (value) VALUES ('ZUB,US');
INSERT Typescalendar (value) VALUES ('TARGET,ZUB');
INSERT Typescalendar (value) VALUES ('TARGET,UK');
INSERT Typescalendar (value) VALUES ('TARGET,US');
INSERT Typescalendar (value) VALUES ('ZUB,UK');
INSERT Typescalendar (value) VALUES ('JP,UK');
INSERT Typescalendar (value) VALUES ('US,UK');
INSERT Typescalendar (value) VALUES ('EUR,USD,GBP,CHF');
INSERT Typescalendar (value) VALUES ('EUR,GBP');

INSERT TypesOptionStyle (value) VALUES ('European');
INSERT TypesOptionStyle (value) VALUES ('American');
INSERT TypesOptionStyle (value) VALUES ('Bermudan');
INSERT TypesOptionSettlement (value) VALUES ('Cash');
INSERT TypesOptionSettlement (value) VALUES ('Physical');
INSERT TypesOptionType (value) VALUES ('Call');
INSERT TypesOptionType (value) VALUES ('Put');

INSERT TypesDiscretizationType (value) VALUES ('Euler');

INSERT TypesShiftType (value) VALUES ('Absolute');
INSERT TypesShiftType (value) VALUES ('Relative');

INSERT TypesSegmentTypeType (value) VALUES ('Average OIS');

INSERT TypesCurveType (value) VALUES ('EquityForecast');
