use ORE

CREATE TABLE TodaysMarketCurveSpecs (
	id varchar(70) NOT NULL
CONSTRAINT PK_TodaysMarketCurveSpecs PRIMARY KEY CLUSTERED (
	id ASC
))

CREATE TABLE TodaysMarketConfigurationTypes (
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketConfigurationTypes PRIMARY KEY CLUSTERED (
	id ASC
))

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
	SecuritiesId varchar(16),
	BaseCorrelationsId varchar(16)
CONSTRAINT PK_TodaysMarketConfiguration PRIMARY KEY CLUSTERED (
	id ASC
))
ALTER TABLE TodaysMarketConfiguration WITH CHECK ADD CONSTRAINT FK_TodaysMarketConfiguration_id FOREIGN KEY(id)
REFERENCES TodaysMarketConfigurationTypes (id)

CREATE TABLE TodaysMarketYieldCurves (
	YieldCurve varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL,
CONSTRAINT PK_TodaysMarketYieldCurves PRIMARY KEY CLUSTERED (
	YieldCurve ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.YieldCurveSpecsCreateI
	ON dbo.TodaysMarketYieldCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.YieldCurve
	FROM inserted
	WHERE NOT exists(SELECT YieldCurve FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.YieldCurve)
END
GO
CREATE TRIGGER dbo.YieldCurveSpecsCreateU
	ON dbo.TodaysMarketYieldCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.YieldCurve
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.YieldCurve AND inserted.YieldCurve = deleted.YieldCurve
END  
GO
CREATE TRIGGER dbo.YieldCurveSpecsCreateD
	ON dbo.TodaysMarketYieldCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.YieldCurve
END
GO
CREATE TABLE TodaysMarketDiscountingCurves (
	DiscountingCurve varchar(70) NOT NULL,
	currency varchar(7) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketDiscountingCurves PRIMARY KEY CLUSTERED (
	DiscountingCurve ASC,
	currency ASC,
	id ASC
))
ALTER TABLE TodaysMarketDiscountingCurves WITH CHECK ADD CONSTRAINT FK_TodaysMarketDiscountingCurves_currency FOREIGN KEY(currency)
REFERENCES TypesCurrencyCode (value)
GO
CREATE TRIGGER dbo.DiscountingCurveSpecsCreateI
	ON dbo.TodaysMarketDiscountingCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.DiscountingCurve
	FROM inserted
	WHERE NOT exists(SELECT DiscountingCurve FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.DiscountingCurve)
END
GO
CREATE TRIGGER dbo.DiscountingCurveSpecsCreateU
	ON dbo.TodaysMarketDiscountingCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.DiscountingCurve
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.DiscountingCurve AND inserted.DiscountingCurve = deleted.DiscountingCurve
END  
GO
CREATE TRIGGER dbo.DiscountingCurveSpecsCreateD
	ON dbo.TodaysMarketDiscountingCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.DiscountingCurve
END
GO
CREATE TABLE TodaysMarketIndexForwardingCurves (
	IndexName varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketIndexForwardingCurves PRIMARY KEY CLUSTERED (
	IndexName ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.ForwardingCurveSpecsCreateI
	ON dbo.TodaysMarketIndexForwardingCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.IndexName
	FROM inserted
	WHERE NOT exists(SELECT IndexName FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.IndexName)
END
GO
CREATE TRIGGER dbo.ForwardingCurveSpecsCreateU
	ON dbo.TodaysMarketIndexForwardingCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.IndexName
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.IndexName AND inserted.IndexName = deleted.IndexName
END  
GO
CREATE TRIGGER dbo.ForwardingCurveSpecsCreateD
	ON dbo.TodaysMarketIndexForwardingCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.IndexName
END
GO
CREATE TABLE TodaysMarketSwapIndexCurves (
	Discounting varchar(30) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketSwapIndexCurves PRIMARY KEY CLUSTERED (
	Discounting ASC,
	name ASC,
	id ASC
))
ALTER TABLE TodaysMarketSwapIndexCurves WITH CHECK ADD CONSTRAINT FK_TodaysMarketSwapIndexCurves_Discounting FOREIGN KEY(Discounting)
REFERENCES TypesIndexName (value)
ALTER TABLE TodaysMarketSwapIndexCurves WITH CHECK ADD CONSTRAINT FK_TodaysMarketSwapIndexCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName (value)

CREATE TABLE TodaysMarketZeroInflationIndexCurves (
	name varchar(30) NOT NULL,
	ZeroInflationIndexCurve varchar(70) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketZeroInflationIndexCurves PRIMARY KEY CLUSTERED (
	ZeroInflationIndexCurve ASC,
	id ASC
))
ALTER TABLE TodaysMarketZeroInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_TodaysMarketZeroInflationIndexCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName (value)
GO
CREATE TRIGGER dbo.InflationSpecsCreateI
	ON dbo.TodaysMarketZeroInflationIndexCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.ZeroInflationIndexCurve
	FROM inserted
	WHERE NOT exists(SELECT ZeroInflationIndexCurve FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.ZeroInflationIndexCurve)
END
GO
CREATE TRIGGER dbo.InflationSpecsCreateU
	ON dbo.TodaysMarketZeroInflationIndexCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.ZeroInflationIndexCurve
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.ZeroInflationIndexCurve AND inserted.ZeroInflationIndexCurve = deleted.ZeroInflationIndexCurve
END  
GO
CREATE TRIGGER dbo.InflationSpecsCreateD
	ON dbo.TodaysMarketZeroInflationIndexCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.ZeroInflationIndexCurve
END
GO
CREATE TABLE TodaysMarketYYInflationIndexCurves (
	name varchar(30) NOT NULL,
	YYInflationIndexCurve varchar(70) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketYYInflationIndexCurves PRIMARY KEY CLUSTERED (
	YYInflationIndexCurve ASC,
	id ASC
))
ALTER TABLE TodaysMarketYYInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_TodaysMarketYYInflationIndexCurves_name FOREIGN KEY(name)
REFERENCES TypesIndexName (value)
GO
CREATE TRIGGER dbo.YYInflationSpecsCreateI
	ON dbo.TodaysMarketYYInflationIndexCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.YYInflationIndexCurve
	FROM inserted
	WHERE NOT exists(SELECT YYInflationIndexCurve FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.YYInflationIndexCurve)
END
GO
CREATE TRIGGER dbo.YYInflationSpecsCreateU
	ON dbo.TodaysMarketYYInflationIndexCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.YYInflationIndexCurve
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.YYInflationIndexCurve AND inserted.YYInflationIndexCurve = deleted.YYInflationIndexCurve
END  
GO
CREATE TRIGGER dbo.YYInflationSpecsCreateD
	ON dbo.TodaysMarketYYInflationIndexCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.YYInflationIndexCurve
END
GO
CREATE TABLE TodaysMarketFxSpots (
	pair varchar(7) NOT NULL,
	FxSpot varchar(70) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketFxSpots PRIMARY KEY CLUSTERED (
	FxSpot ASC,
	id ASC
))
ALTER TABLE TodaysMarketFxSpots WITH CHECK ADD CONSTRAINT FK_TodaysMarketFxSpots_pair FOREIGN KEY(pair)
REFERENCES TypesCurrencyPair (value)
GO
CREATE TRIGGER dbo.FxSpotSpecsCreateI
	ON dbo.TodaysMarketFxSpots
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.FxSpot
	FROM inserted
	WHERE NOT exists(SELECT FxSpot FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.FxSpot)
END
GO
CREATE TRIGGER dbo.FxSpotSpecsCreateU
	ON dbo.TodaysMarketFxSpots
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.FxSpot
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.FxSpot AND inserted.FxSpot = deleted.FxSpot
END  
GO
CREATE TRIGGER dbo.FxSpotSpecsCreateD
	ON dbo.TodaysMarketFxSpots
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.FxSpot
END
GO
CREATE TABLE TodaysMarketFxVolatilities (
	pair varchar(7) NOT NULL,
	FxVolatility  varchar(70) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketFxVolatilities PRIMARY KEY CLUSTERED (
	FxVolatility ASC,
	id ASC
))
ALTER TABLE TodaysMarketFxVolatilities WITH CHECK ADD CONSTRAINT FK_TodaysMarketFxVolatilities_pair FOREIGN KEY(pair)
REFERENCES TypesCurrencyPair (value)
GO
CREATE TRIGGER dbo.FxVolatilitySpecsCreateI
	ON dbo.TodaysMarketFxVolatilities
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.FxVolatility
	FROM inserted
	WHERE NOT exists(SELECT FxVolatility FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.FxVolatility)
END
GO
CREATE TRIGGER dbo.FxVolatilitySpecsCreateU
	ON dbo.TodaysMarketFxVolatilities
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.FxVolatility
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.FxVolatility AND inserted.FxVolatility = deleted.FxVolatility
END  
GO
CREATE TRIGGER dbo.FxVolatilitySpecsCreateD
	ON dbo.TodaysMarketFxVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.FxVolatility
END
GO
CREATE TABLE TodaysMarketSwaptionVolatilities (
	currency varchar(7) NOT NULL,
	SwaptionVolatility varchar(70) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketSwaptionVolatilities PRIMARY KEY CLUSTERED (
	SwaptionVolatility ASC,
	id ASC
))
ALTER TABLE TodaysMarketSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_TodaysMarketSwaptionVolatilities_currency FOREIGN KEY(currency)
REFERENCES TypesCurrencyCode (value)
GO
CREATE TRIGGER dbo.SwaptionVolatilitySpecsCreateI
	ON dbo.TodaysMarketSwaptionVolatilities
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.SwaptionVolatility
	FROM inserted
	WHERE NOT exists(SELECT SwaptionVolatility FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.SwaptionVolatility)
END
GO
CREATE TRIGGER dbo.SwaptionVolatilitySpecsCreateU
	ON dbo.TodaysMarketSwaptionVolatilities
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.SwaptionVolatility
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.SwaptionVolatility AND inserted.SwaptionVolatility = deleted.SwaptionVolatility
END  
GO
CREATE TRIGGER dbo.SwaptionVolatilitySpecsCreateD
	ON dbo.TodaysMarketSwaptionVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.SwaptionVolatility
END
GO
CREATE TABLE TodaysMarketCapFloorVolatilities (
	currency varchar(7) NOT NULL,
	CapFloorVolatility varchar(70) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketCapFloorVolatilities PRIMARY KEY CLUSTERED (
	CapFloorVolatility ASC,
	id ASC
))
ALTER TABLE TodaysMarketCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_TodaysMarketCapFloorVolatilities_currency FOREIGN KEY(currency)
REFERENCES TypesCurrencyCode (value)
GO
CREATE TRIGGER dbo.CapFloorVolatilitySpecsCreateI
	ON dbo.TodaysMarketCapFloorVolatilities
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.CapFloorVolatility
	FROM inserted
	WHERE NOT exists(SELECT CapFloorVolatility FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.CapFloorVolatility)
END
GO
CREATE TRIGGER dbo.CapFloorVolatilitySpecsCreateU
	ON dbo.TodaysMarketCapFloorVolatilities
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.CapFloorVolatility
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.CapFloorVolatility AND inserted.CapFloorVolatility = deleted.CapFloorVolatility
END  
GO
CREATE TRIGGER dbo.CapFloorVolatilitySpecsCreateD
	ON dbo.TodaysMarketCapFloorVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.CapFloorVolatility
END
GO
CREATE TABLE TodaysMarketDefaultCurves (
	DefaultCurve varchar(70) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketDefaultCurves PRIMARY KEY CLUSTERED (
	DefaultCurve ASC,
	name ASC,
	id ASC
))
ALTER TABLE TodaysMarketDefaultCurves WITH CHECK ADD CONSTRAINT FK_TodaysMarketDefaultCurves_name FOREIGN KEY(name)
REFERENCES TypesParties (value)
GO
CREATE TRIGGER dbo.DefaultSpecsCreateI
	ON dbo.TodaysMarketDefaultCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.DefaultCurve
	FROM inserted
	WHERE NOT exists(SELECT DefaultCurve FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.DefaultCurve)
END
GO
CREATE TRIGGER dbo.DefaultSpecsCreateU
	ON dbo.TodaysMarketDefaultCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.DefaultCurve
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.DefaultCurve AND inserted.DefaultCurve = deleted.DefaultCurve
END  
GO
CREATE TRIGGER dbo.DefaultSpecsCreateD
	ON dbo.TodaysMarketDefaultCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.DefaultCurve
END
GO
CREATE TABLE TodaysMarketInflationCapFloorPriceSurfaces (
	InflationCapFloorPriceSurface varchar(70) NOT NULL,
	name varchar(30) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketInflationCapFloorPriceSurfaces PRIMARY KEY CLUSTERED (
	InflationCapFloorPriceSurface ASC,
	id ASC
))
ALTER TABLE TodaysMarketInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_TodaysMarketInflationCapFloorPriceSurfaces_name FOREIGN KEY(name)
REFERENCES TypesIndexName (value)
GO
CREATE TRIGGER dbo.InflationCapFloorPriceSpecsCreateI
	ON dbo.TodaysMarketInflationCapFloorPriceSurfaces
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.InflationCapFloorPriceSurface
	FROM inserted
	WHERE NOT exists(SELECT InflationCapFloorPriceSurface FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.InflationCapFloorPriceSurface)
END
GO
CREATE TRIGGER dbo.InflationCapFloorPriceSpecsCreateU
	ON dbo.TodaysMarketInflationCapFloorPriceSurfaces
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.InflationCapFloorPriceSurface
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.InflationCapFloorPriceSurface AND inserted.InflationCapFloorPriceSurface = deleted.InflationCapFloorPriceSurface
END  
GO
CREATE TRIGGER dbo.InflationCapFloorPriceSpecsCreateD
	ON dbo.TodaysMarketInflationCapFloorPriceSurfaces
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.InflationCapFloorPriceSurface
END
GO
CREATE TABLE TodaysMarketEquityCurves (
	EquityCurve varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketEquityCurves PRIMARY KEY CLUSTERED (
	EquityCurve ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.EquityCurveSpecsCreateI
	ON dbo.TodaysMarketEquityCurves
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.EquityCurve
	FROM inserted
	WHERE NOT exists(SELECT EquityCurve FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.EquityCurve)
END
GO
CREATE TRIGGER dbo.EquityCurveSpecsCreateU
	ON dbo.TodaysMarketEquityCurves
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.EquityCurve
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.EquityCurve AND inserted.EquityCurve = deleted.EquityCurve
END  
GO
CREATE TRIGGER dbo.EquityCurveSpecsCreateD
	ON dbo.TodaysMarketEquityCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.EquityCurve
END
GO
CREATE TABLE TodaysMarketCDSVolatilities (
	CDSVolatility varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketCDSVolatilities PRIMARY KEY CLUSTERED (
	CDSVolatility ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.CDSVolatilitySpecsCreateI
	ON dbo.TodaysMarketCDSVolatilities
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.CDSVolatility
	FROM inserted
	WHERE NOT exists(SELECT CDSVolatility FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.CDSVolatility)
END
GO
CREATE TRIGGER dbo.CDSVolatilitySpecsCreateU
	ON dbo.TodaysMarketCDSVolatilities
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.CDSVolatility
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.CDSVolatility AND inserted.CDSVolatility = deleted.CDSVolatility
END  
GO
CREATE TRIGGER dbo.CDSVolatilitySpecsCreateD
	ON dbo.TodaysMarketCDSVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.CDSVolatility
END
GO
CREATE TABLE TodaysMarketEquityVolatilities (
	EquityVolatility varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketEquityVolatilities PRIMARY KEY CLUSTERED (
	EquityVolatility ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.EquityVolatilitySpecsCreateI
	ON dbo.TodaysMarketEquityVolatilities
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.EquityVolatility
	FROM inserted
	WHERE NOT exists(SELECT EquityVolatility FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.EquityVolatility)
END
GO
CREATE TRIGGER dbo.EquityVolatilitySpecsCreateU
	ON dbo.TodaysMarketEquityVolatilities
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.EquityVolatility
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.EquityVolatility AND inserted.EquityVolatility = deleted.EquityVolatility
END  
GO
CREATE TRIGGER dbo.EquityVolatilitySpecsCreateD
	ON dbo.TodaysMarketEquityVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.EquityVolatility
END
GO
CREATE TABLE TodaysMarketSecurities (
	Security varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketSecurities PRIMARY KEY CLUSTERED (
	Security ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.SecuritySpecsCreateI
	ON dbo.TodaysMarketSecurities
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.Security
	FROM inserted
	WHERE NOT exists(SELECT Security FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.Security)
END
GO
CREATE TRIGGER dbo.SecuritySpecsCreateU
	ON dbo.TodaysMarketSecurities
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.Security
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.Security AND inserted.Security = deleted.Security
END  
GO
CREATE TRIGGER dbo.SecuritySpecsCreateD
	ON dbo.TodaysMarketSecurities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.Security
END
GO
CREATE TABLE TodaysMarketBaseCorrelations (
	BaseCorrelation varchar(70) NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(16) NOT NULL
CONSTRAINT PK_TodaysMarketBaseCorrelations PRIMARY KEY CLUSTERED (
	BaseCorrelation ASC,
	id ASC
))
GO
CREATE TRIGGER dbo.BaseCorrelationSpecsCreateI
	ON dbo.TodaysMarketBaseCorrelations
FOR INSERT AS  
BEGIN
	INSERT dbo.TodaysMarketCurveSpecs
	SELECT inserted.BaseCorrelation
	FROM inserted
	WHERE NOT exists(SELECT BaseCorrelation FROM dbo.TodaysMarketCurveSpecs WHERE id = inserted.BaseCorrelation)
END
GO
CREATE TRIGGER dbo.BaseCorrelationSpecsCreateU
	ON dbo.TodaysMarketBaseCorrelations
FOR UPDATE AS  
BEGIN
	UPDATE dbo.TodaysMarketCurveSpecs  
	SET id = inserted.BaseCorrelation
	FROM inserted, deleted
	WHERE dbo.TodaysMarketCurveSpecs.id = deleted.BaseCorrelation AND inserted.BaseCorrelation = deleted.BaseCorrelation
END  
GO
CREATE TRIGGER dbo.BaseCorrelationSpecsCreateD
	ON dbo.TodaysMarketBaseCorrelations
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.BaseCorrelation
END
GO
