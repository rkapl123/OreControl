use ORE
GO
-- Triggers for TodaysMarket<> tables to enable filling of reference table TodaysMarketCurveSpecs
-- this reference table is used in Curve configurations and other places.
CREATE TRIGGER YieldCurveSpecsCreateI
	ON TodaysMarketYieldCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.YieldCurve
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.YieldCurve)
END
GO
CREATE TRIGGER [dbo].[YieldCurveSpecsCreateU]
	ON [dbo].[TodaysMarketYieldCurves]
AFTER UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.YieldCurve AND
	(SELECT count(*) FROM TodaysMarketYieldCurves WHERE YieldCurve = deleted.YieldCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketDiscountingCurves WHERE DiscountingCurve = deleted.YieldCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketIndexForwardingCurves WHERE IndexName = deleted.YieldCurve) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.YieldCurve id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.YieldCurve)
END
GO
CREATE TRIGGER YieldCurveSpecsCreateD
	ON TodaysMarketYieldCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.YieldCurve
END
GO
CREATE TRIGGER DiscountingCurveSpecsCreateI
	ON TodaysMarketDiscountingCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.DiscountingCurve
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.DiscountingCurve)
END
GO
CREATE TRIGGER DiscountingCurveSpecsCreateU
	ON TodaysMarketDiscountingCurves
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.DiscountingCurve AND
	(SELECT count(*) FROM TodaysMarketYieldCurves WHERE YieldCurve = deleted.DiscountingCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketDiscountingCurves WHERE DiscountingCurve = deleted.DiscountingCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketIndexForwardingCurves WHERE IndexName = deleted.DiscountingCurve) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.DiscountingCurve id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.DiscountingCurve)
END
GO
CREATE TRIGGER DiscountingCurveSpecsCreateD
	ON TodaysMarketDiscountingCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.DiscountingCurve
END
GO
CREATE TRIGGER ForwardingCurveSpecsCreateI
	ON TodaysMarketIndexForwardingCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.IndexName
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.IndexName)
END
GO
CREATE TRIGGER ForwardingCurveSpecsCreateU
	ON TodaysMarketIndexForwardingCurves
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.IndexName AND
	(SELECT count(*) FROM TodaysMarketIndexForwardingCurves WHERE IndexName = deleted.IndexName) = 0 AND
	(SELECT count(*) FROM TodaysMarketYieldCurves WHERE YieldCurve = deleted.IndexName) = 0 AND
	(SELECT count(*) FROM TodaysMarketDiscountingCurves WHERE DiscountingCurve = deleted.IndexName) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.IndexName id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.IndexName)
END
GO
CREATE TRIGGER ForwardingCurveSpecsCreateD
	ON TodaysMarketIndexForwardingCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.IndexName
END
GO

CREATE TRIGGER InflationSpecsCreateI
	ON TodaysMarketZeroInflationIndexCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.ZeroInflationIndexCurve
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.ZeroInflationIndexCurve)
END
GO
CREATE TRIGGER InflationSpecsCreateU
	ON TodaysMarketZeroInflationIndexCurves
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.ZeroInflationIndexCurve AND
	(SELECT count(*) FROM TodaysMarketZeroInflationIndexCurves WHERE ZeroInflationIndexCurve = deleted.ZeroInflationIndexCurve) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.ZeroInflationIndexCurve id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.ZeroInflationIndexCurve)
END
GO
CREATE TRIGGER InflationSpecsCreateD
	ON TodaysMarketZeroInflationIndexCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.ZeroInflationIndexCurve
END
GO

CREATE TRIGGER YYInflationSpecsCreateI
	ON TodaysMarketYYInflationIndexCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.YYInflationIndexCurve
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.YYInflationIndexCurve)
END
GO
CREATE TRIGGER YYInflationSpecsCreateU
	ON TodaysMarketYYInflationIndexCurves
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.YYInflationIndexCurve AND
	(SELECT count(*) FROM TodaysMarketYYInflationIndexCurves WHERE YYInflationIndexCurve = deleted.YYInflationIndexCurve) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.YYInflationIndexCurve id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.YYInflationIndexCurve)
END
GO
CREATE TRIGGER YYInflationSpecsCreateD
	ON TodaysMarketYYInflationIndexCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.YYInflationIndexCurve
END
GO


CREATE TRIGGER FxSpotSpecsCreateI
	ON TodaysMarketFxSpots
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.FxSpot
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.FxSpot)
END
GO
CREATE TRIGGER FxSpotSpecsCreateU
	ON TodaysMarketFxSpots
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.FxSpot AND
	(SELECT count(*) FROM TodaysMarketFxSpots WHERE FxSpot = deleted.FxSpot) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.FxSpot id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.FxSpot)
END
GO
CREATE TRIGGER FxSpotSpecsCreateD
	ON TodaysMarketFxSpots
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.FxSpot
END
GO

CREATE TRIGGER FxVolatilitySpecsCreateI
	ON TodaysMarketFxVolatilities
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.FxVolatility
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.FxVolatility)
END
GO
CREATE TRIGGER FxVolatilitySpecsCreateU
	ON TodaysMarketFxVolatilities
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.FxVolatility AND
	(SELECT count(*) FROM TodaysMarketFxVolatilities WHERE FxVolatility = deleted.FxVolatility) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.FxVolatility id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.FxVolatility)
END
GO
CREATE TRIGGER FxVolatilitySpecsCreateD
	ON TodaysMarketFxVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.FxVolatility
END
GO


CREATE TRIGGER SwaptionVolatilitySpecsCreateI
	ON TodaysMarketSwaptionVolatilities
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.SwaptionVolatility
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.SwaptionVolatility)
END
GO
CREATE TRIGGER SwaptionVolatilitySpecsCreateU
	ON TodaysMarketSwaptionVolatilities
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.SwaptionVolatility AND
	(SELECT count(*) FROM TodaysMarketSwaptionVolatilities WHERE SwaptionVolatility = deleted.SwaptionVolatility) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.SwaptionVolatility id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.SwaptionVolatility)
END
GO
CREATE TRIGGER SwaptionVolatilitySpecsCreateD
	ON TodaysMarketSwaptionVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.SwaptionVolatility
END
GO

CREATE TRIGGER CapFloorVolatilitySpecsCreateI
	ON TodaysMarketCapFloorVolatilities
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.CapFloorVolatility
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.CapFloorVolatility)
END
GO
CREATE TRIGGER CapFloorVolatilitySpecsCreateU
	ON TodaysMarketCapFloorVolatilities
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.CapFloorVolatility AND
	(SELECT count(*) FROM TodaysMarketCapFloorVolatilities WHERE CapFloorVolatility = deleted.CapFloorVolatility) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.CapFloorVolatility id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.CapFloorVolatility)
END
GO
CREATE TRIGGER CapFloorVolatilitySpecsCreateD
	ON TodaysMarketCapFloorVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.CapFloorVolatility
END
GO

CREATE TRIGGER DefaultSpecsCreateI
	ON TodaysMarketDefaultCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.DefaultCurve
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.DefaultCurve)
END
GO
CREATE TRIGGER DefaultSpecsCreateU
	ON TodaysMarketDefaultCurves
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.DefaultCurve AND
	(SELECT count(*) FROM TodaysMarketDefaultCurves WHERE DefaultCurve = deleted.DefaultCurve) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.DefaultCurve id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.DefaultCurve)
END
GO
CREATE TRIGGER DefaultSpecsCreateD
	ON TodaysMarketDefaultCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.DefaultCurve
END
GO


CREATE TRIGGER InflationCapFloorPriceSpecsCreateI
	ON TodaysMarketInflationCapFloorPriceSurfaces
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.InflationCapFloorPriceSurface
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.InflationCapFloorPriceSurface)
END
GO
CREATE TRIGGER InflationCapFloorPriceSpecsCreateU
	ON TodaysMarketInflationCapFloorPriceSurfaces
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.InflationCapFloorPriceSurface AND
	(SELECT count(*) FROM TodaysMarketInflationCapFloorPriceSurfaces WHERE InflationCapFloorPriceSurface = deleted.InflationCapFloorPriceSurface) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.InflationCapFloorPriceSurface id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.InflationCapFloorPriceSurface)
END
GO
CREATE TRIGGER InflationCapFloorPriceSpecsCreateD
	ON TodaysMarketInflationCapFloorPriceSurfaces
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.InflationCapFloorPriceSurface
END
GO

CREATE TRIGGER EquityCurveSpecsCreateI
	ON TodaysMarketEquityCurves
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.EquityCurve
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.EquityCurve)
END
GO
CREATE TRIGGER EquityCurveSpecsCreateU
	ON TodaysMarketEquityCurves
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.EquityCurve AND
	(SELECT count(*) FROM TodaysMarketEquityCurves WHERE EquityCurve = deleted.EquityCurve) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.EquityCurve id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.EquityCurve)
END
GO
CREATE TRIGGER EquityCurveSpecsCreateD
	ON TodaysMarketEquityCurves
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.EquityCurve
END
GO

CREATE TRIGGER CDSVolatilitySpecsCreateI
	ON TodaysMarketCDSVolatilities
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.CDSVolatility
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.CDSVolatility)
END
GO
CREATE TRIGGER CDSVolatilitySpecsCreateU
	ON TodaysMarketCDSVolatilities
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.CDSVolatility AND
	(SELECT count(*) FROM TodaysMarketCDSVolatilities WHERE CDSVolatility = deleted.CDSVolatility) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.CDSVolatility id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.CDSVolatility)
END
GO
CREATE TRIGGER CDSVolatilitySpecsCreateD
	ON TodaysMarketCDSVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.CDSVolatility
END
GO

CREATE TRIGGER EquityVolatilitySpecsCreateI
	ON TodaysMarketEquityVolatilities
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.EquityVolatility
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.EquityVolatility)
END
GO
CREATE TRIGGER EquityVolatilitySpecsCreateU
	ON TodaysMarketEquityVolatilities
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.EquityVolatility AND
	(SELECT count(*) FROM TodaysMarketEquityVolatilities WHERE EquityVolatility = deleted.EquityVolatility) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.EquityVolatility id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.EquityVolatility)
END
GO
CREATE TRIGGER EquityVolatilitySpecsCreateD
	ON TodaysMarketEquityVolatilities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.EquityVolatility
END
GO

CREATE TRIGGER SecuritySpecsCreateI
	ON TodaysMarketSecurities
FOR INSERT AS  
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.Security
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.Security)
END
GO
CREATE TRIGGER SecuritySpecsCreateU
	ON TodaysMarketSecurities
FOR UPDATE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.Security AND
	(SELECT count(*) FROM TodaysMarketSecurities WHERE Security = deleted.Security) = 0
	
	INSERT TodaysMarketCurveSpecs
	SELECT inserted.Security id
	FROM inserted
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = inserted.Security)
END
GO
CREATE TRIGGER SecuritySpecsCreateD
	ON TodaysMarketSecurities
FOR DELETE AS  
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs, deleted
	WHERE TodaysMarketCurveSpecs.id = deleted.Security
END
GO