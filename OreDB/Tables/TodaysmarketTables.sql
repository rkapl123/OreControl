use ORE;

CREATE TABLE TodaysMarketCurveSpecs (
	id varchar(70) NOT NULL,
CONSTRAINT PK_TodaysMarketCurveSpecs PRIMARY KEY CLUSTERED (
	id ASC
));

CREATE TABLE TodaysMarketConfigurationTypes (
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketConfigurationTypes PRIMARY KEY CLUSTERED (
	id ASC
));

-- relates to TodaysMarketConfigurationTypes and TodaysMarket tables below
CREATE TABLE TodaysMarketConfiguration (
	id varchar(16) NOT NULL,
	GroupingId varchar(70),
	DiscountingCurvesId varchar(16),
	YieldCurvesId varchar(16),
	IndexForwardingCurvesId varchar(16),
	SwapIndexCurvesId varchar(16),
	ZeroInflationIndexCurvesId varchar(16),
	YYInflationIndexCurvesId varchar(16),
	FxSpotsId varchar(16),
	FxVolatilitiesId varchar(16),
	SwaptionVolatilitiesId varchar(16),
	CapFloorVolatilitiesId varchar(16),
	CDSVolatilitiesId varchar(16),
	DefaultCurvesId varchar(16),
	InflationCapFloorPriceSurfacesId varchar(16),
	EquityCurvesId varchar(16),
	EquityVolatilitiesId varchar(16),
CONSTRAINT PK_TodaysMarketConfiguration PRIMARY KEY CLUSTERED (
	id ASC
));
ALTER TABLE TodaysMarketConfiguration ADD CONSTRAINT FK_TodaysMarketConfiguration_id FOREIGN KEY(id)
REFERENCES TodaysMarketConfigurationTypes(id);


CREATE TABLE TodaysMarketYieldCurves (
	YieldCurve varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketYieldCurves PRIMARY KEY CLUSTERED (
	YieldCurve ASC,
	id ASC
));


CREATE TABLE TodaysMarketDiscountingCurves (
	DiscountingCurve varchar(70) NOT NULL,
	currency varchar(7) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketDiscountingCurves PRIMARY KEY CLUSTERED (
	DiscountingCurve ASC,
	currency ASC,
	id ASC
));

ALTER TABLE TodaysMarketDiscountingCurves ADD CONSTRAINT FK_TodaysMarketDiscountingCurves_currency FOREIGN KEY(currency)
REFERENCES TypesCurrencyCode(value);


CREATE TABLE TodaysMarketIndexForwardingCurves (
	IndexName varchar(70) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketIndexForwardingCurves PRIMARY KEY CLUSTERED (
	IndexName ASC,
	id ASC
));
ALTER TABLE TodaysMarketIndexForwardingCurves ADD CONSTRAINT FK_TodaysMarketIndexForwardingCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName(value);

CREATE TABLE TodaysMarketSwapIndexCurves (
	Discounting varchar(30) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketSwapIndexCurves PRIMARY KEY CLUSTERED (
	Discounting ASC,
	name ASC,
	id ASC
));

ALTER TABLE TodaysMarketSwapIndexCurves ADD CONSTRAINT FK_TodaysMarketSwapIndexCurves_Discounting FOREIGN KEY(Discounting)
REFERENCES TypesIndexName(value);
ALTER TABLE TodaysMarketSwapIndexCurves ADD CONSTRAINT FK_TodaysMarketSwapIndexCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName(value);


CREATE TABLE TodaysMarketZeroInflationIndexCurves (
	name varchar(30) NOT NULL,
	ZeroInflationIndexCurve varchar(70) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketZeroInflationIndexCurves PRIMARY KEY CLUSTERED (
	ZeroInflationIndexCurve ASC,
	id ASC
));

ALTER TABLE TodaysMarketZeroInflationIndexCurves ADD CONSTRAINT FK_TodaysMarketZeroInflationIndexCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName(value);


CREATE TABLE TodaysMarketYYInflationIndexCurves (
	name varchar(30) NOT NULL,
	YYInflationIndexCurve varchar(70) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketYYInflationIndexCurves PRIMARY KEY CLUSTERED (
	YYInflationIndexCurve ASC,
	id ASC
));

ALTER TABLE TodaysMarketYYInflationIndexCurves ADD CONSTRAINT FK_TodaysMarketYYInflationIndexCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName(value);


CREATE TABLE TodaysMarketFxSpots (
	pair varchar(7) NOT NULL,
	FxSpot varchar(70) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketFxSpots PRIMARY KEY CLUSTERED (
	FxSpot ASC,
	id ASC
));

ALTER TABLE TodaysMarketFxSpots ADD CONSTRAINT FK_TodaysMarketFxSpots_pair FOREIGN KEY(pair)
REFERENCES TypesCurrencyPair(value);


CREATE TABLE TodaysMarketFxVolatilities (
	pair varchar(7) NOT NULL,
	FxVolatility  varchar(70) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketFxVolatilities PRIMARY KEY CLUSTERED (
	FxVolatility ASC,
	id ASC
));

ALTER TABLE TodaysMarketFxVolatilities ADD CONSTRAINT FK_TodaysMarketFxVolatilities_pair FOREIGN KEY(pair)
REFERENCES TypesCurrencyPair(value);


CREATE TABLE TodaysMarketSwaptionVolatilities (
	currency varchar(7) NOT NULL,
	SwaptionVolatility varchar(70) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketSwaptionVolatilities PRIMARY KEY CLUSTERED (
	SwaptionVolatility ASC,
	id ASC
));

ALTER TABLE TodaysMarketSwaptionVolatilities ADD CONSTRAINT FK_TodaysMarketSwaptionVolatilities_currency FOREIGN KEY(currency)
REFERENCES TypesCurrencyCode(value);


CREATE TABLE TodaysMarketCapFloorVolatilities (
	currency varchar(7) NOT NULL,
	CapFloorVolatility varchar(70) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketCapFloorVolatilities PRIMARY KEY CLUSTERED (
	CapFloorVolatility ASC,
	id ASC
));

ALTER TABLE TodaysMarketCapFloorVolatilities ADD CONSTRAINT FK_TodaysMarketCapFloorVolatilities_currency FOREIGN KEY(currency)
REFERENCES TypesCurrencyCode(value);


CREATE TABLE TodaysMarketDefaultCurves (
	DefaultCurve varchar(70) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketDefaultCurves PRIMARY KEY CLUSTERED (
	DefaultCurve ASC,
	name ASC,
	id ASC
));

ALTER TABLE TodaysMarketDefaultCurves ADD CONSTRAINT FK_TodaysMarketDefaultCurves_name FOREIGN KEY(name)
REFERENCES TypesParties(value);


CREATE TABLE TodaysMarketInflationCapFloorPriceSurfaces (
	InflationCapFloorPriceSurface varchar(70) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketInflationCapFloorPriceSurfaces PRIMARY KEY CLUSTERED (
	InflationCapFloorPriceSurface ASC,
	id ASC
));

ALTER TABLE TodaysMarketInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_TodaysMarketInflationCapFloorPriceSurfaces_name FOREIGN KEY(name)
REFERENCES TypesIndexName(value);


CREATE TABLE TodaysMarketEquityCurves (
	EquityCurve varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketEquityCurves PRIMARY KEY CLUSTERED (
	EquityCurve ASC,
	id ASC
));


CREATE TABLE TodaysMarketCDSVolatilities (
	CDSVolatility varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketCDSVolatilities PRIMARY KEY CLUSTERED (
	CDSVolatility ASC,
	id ASC
));


CREATE TABLE TodaysMarketEquityVolatilities (
	EquityVolatility varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketEquityVolatilities PRIMARY KEY CLUSTERED (
	EquityVolatility ASC,
	id ASC
));


CREATE TABLE TodaysMarketSecurities (
	Security varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketSecurities PRIMARY KEY CLUSTERED (
	Security ASC,
	id ASC
));


CREATE TABLE TodaysMarketBaseCorrelations (
	BaseCorrelation varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketBaseCorrelations PRIMARY KEY CLUSTERED (
	BaseCorrelation ASC,
	id ASC
));

