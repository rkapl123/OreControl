use ORE
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