use ORE;
-- Triggers for TodaysMarket<> tables to enable filling of reference table TodaysMarketCurveSpecs
-- this reference table is used in Curve configurations and other places.

DELIMITER $$

CREATE TRIGGER YieldCurveSpecsCreateI
AFTER INSERT ON TodaysMarketYieldCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.YieldCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.YieldCurve);
END$$

CREATE TRIGGER YieldCurveSpecsCreateU
AFTER UPDATE ON TodaysMarketYieldCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.YieldCurve AND
	(SELECT count(*) FROM TodaysMarketYieldCurves WHERE YieldCurve = OLD.YieldCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketDiscountingCurves WHERE DiscountingCurve = OLD.YieldCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketIndexForwardingCurves WHERE IndexName = OLD.YieldCurve) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.YieldCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.YieldCurve);
END$$

CREATE TRIGGER YieldCurveSpecsCreateD
AFTER DELETE ON TodaysMarketYieldCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.YieldCurve;
END$$



CREATE TRIGGER DiscountingCurveSpecsCreateI
AFTER INSERT ON TodaysMarketDiscountingCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.DiscountingCurve
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.DiscountingCurve);
END$$

CREATE TRIGGER DiscountingCurveSpecsCreateU
AFTER UPDATE ON TodaysMarketDiscountingCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.DiscountingCurve AND
	(SELECT count(*) FROM TodaysMarketYieldCurves WHERE YieldCurve = OLD.DiscountingCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketDiscountingCurves WHERE DiscountingCurve = OLD.DiscountingCurve) = 0 AND
	(SELECT count(*) FROM TodaysMarketIndexForwardingCurves WHERE IndexName = OLD.DiscountingCurve) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.DiscountingCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.DiscountingCurve);
END$$

CREATE TRIGGER DiscountingCurveSpecsCreateD
AFTER DELETE ON TodaysMarketDiscountingCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.DiscountingCurve;
END$$



CREATE TRIGGER ForwardingCurveSpecsCreateI
AFTER INSERT ON TodaysMarketIndexForwardingCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.IndexName
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.IndexName);
END$$

CREATE TRIGGER ForwardingCurveSpecsCreateU
AFTER UPDATE ON TodaysMarketIndexForwardingCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.IndexName AND
	(SELECT count(*) FROM TodaysMarketIndexForwardingCurves WHERE IndexName = OLD.IndexName) = 0 AND
	(SELECT count(*) FROM TodaysMarketYieldCurves WHERE YieldCurve = OLD.IndexName) = 0 AND
	(SELECT count(*) FROM TodaysMarketDiscountingCurves WHERE DiscountingCurve = OLD.IndexName) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.IndexName id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.IndexName);

END$$

CREATE TRIGGER ForwardingCurveSpecsCreateD
AFTER DELETE ON TodaysMarketIndexForwardingCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.IndexName;
END$$



CREATE TRIGGER InflationSpecsCreateI
AFTER INSERT ON TodaysMarketZeroInflationIndexCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.ZeroInflationIndexCurve
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.ZeroInflationIndexCurve);
END$$

CREATE TRIGGER InflationSpecsCreateU
AFTER UPDATE ON TodaysMarketZeroInflationIndexCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.ZeroInflationIndexCurve AND
	(SELECT count(*) FROM TodaysMarketZeroInflationIndexCurves WHERE ZeroInflationIndexCurve = OLD.ZeroInflationIndexCurve) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.ZeroInflationIndexCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.ZeroInflationIndexCurve);

END$$

CREATE TRIGGER InflationSpecsCreateD
AFTER DELETE ON TodaysMarketZeroInflationIndexCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.ZeroInflationIndexCurve;
END$$



CREATE TRIGGER YYInflationSpecsCreateI
AFTER INSERT ON TodaysMarketYYInflationIndexCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.YYInflationIndexCurve
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.YYInflationIndexCurve);
END$$

CREATE TRIGGER YYInflationSpecsCreateU
AFTER UPDATE ON TodaysMarketYYInflationIndexCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.YYInflationIndexCurve AND
	(SELECT count(*) FROM TodaysMarketYYInflationIndexCurves WHERE YYInflationIndexCurve = OLD.YYInflationIndexCurve) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.YYInflationIndexCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.YYInflationIndexCurve);

END$$

CREATE TRIGGER YYInflationSpecsCreateD
AFTER DELETE ON TodaysMarketYYInflationIndexCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.YYInflationIndexCurve;
END$$



CREATE TRIGGER FxSpotSpecsCreateI
AFTER INSERT ON TodaysMarketFxSpots
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.FxSpot
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.FxSpot);
END$$

CREATE TRIGGER FxSpotSpecsCreateU
AFTER UPDATE ON TodaysMarketFxSpots
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.FxSpot AND
	(SELECT count(*) FROM TodaysMarketFxSpots WHERE FxSpot = OLD.FxSpot) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.FxSpot id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.FxSpot);

END$$

CREATE TRIGGER FxSpotSpecsCreateD
AFTER DELETE ON TodaysMarketFxSpots
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.FxSpot;
END$$



CREATE TRIGGER FxVolatilitySpecsCreateI
AFTER INSERT ON TodaysMarketFxVolatilities
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.FxVolatility
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.FxVolatility);
END$$

CREATE TRIGGER FxVolatilitySpecsCreateU
AFTER UPDATE ON TodaysMarketFxVolatilities
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.FxVolatility AND
	(SELECT count(*) FROM TodaysMarketFxVolatilities WHERE FxVolatility = OLD.FxVolatility) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.FxVolatility id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.FxVolatility);
END$$

CREATE TRIGGER FxVolatilitySpecsCreateD
AFTER DELETE ON TodaysMarketFxVolatilities
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.FxVolatility;
END$$



CREATE TRIGGER SwaptionVolatilitySpecsCreateI
AFTER INSERT ON TodaysMarketSwaptionVolatilities
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.SwaptionVolatility
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.SwaptionVolatility);
END$$

CREATE TRIGGER SwaptionVolatilitySpecsCreateU
AFTER UPDATE ON TodaysMarketSwaptionVolatilities
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.SwaptionVolatility AND
	(SELECT count(*) FROM TodaysMarketSwaptionVolatilities WHERE SwaptionVolatility = OLD.SwaptionVolatility) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.SwaptionVolatility id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.SwaptionVolatility);
END$$

CREATE TRIGGER SwaptionVolatilitySpecsCreateD
AFTER DELETE ON TodaysMarketSwaptionVolatilities
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.SwaptionVolatility;
END$$



CREATE TRIGGER CapFloorVolatilitySpecsCreateI
AFTER INSERT ON TodaysMarketCapFloorVolatilities
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.CapFloorVolatility
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.CapFloorVolatility);
END$$

CREATE TRIGGER CapFloorVolatilitySpecsCreateU
AFTER UPDATE ON TodaysMarketCapFloorVolatilities
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.CapFloorVolatility AND
	(SELECT count(*) FROM TodaysMarketCapFloorVolatilities WHERE CapFloorVolatility = OLD.CapFloorVolatility) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.CapFloorVolatility id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.CapFloorVolatility);

END$$

CREATE TRIGGER CapFloorVolatilitySpecsCreateD
AFTER DELETE ON TodaysMarketCapFloorVolatilities
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.CapFloorVolatility;
END$$



CREATE TRIGGER DefaultSpecsCreateI
AFTER INSERT ON TodaysMarketDefaultCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.DefaultCurve
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.DefaultCurve);
END$$

CREATE TRIGGER DefaultSpecsCreateU
AFTER UPDATE ON TodaysMarketDefaultCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.DefaultCurve AND
	(SELECT count(*) FROM TodaysMarketDefaultCurves WHERE DefaultCurve = OLD.DefaultCurve) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.DefaultCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.DefaultCurve);

END$$

CREATE TRIGGER DefaultSpecsCreateD
AFTER DELETE ON TodaysMarketDefaultCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.DefaultCurve;
END$$



CREATE TRIGGER InflationCapFloorPriceSpecsCreateI
AFTER INSERT ON TodaysMarketInflationCapFloorPriceSurfaces
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.InflationCapFloorPriceSurface
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.InflationCapFloorPriceSurface);
END$$

CREATE TRIGGER InflationCapFloorPriceSpecsCreateU
AFTER UPDATE ON TodaysMarketInflationCapFloorPriceSurfaces
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.InflationCapFloorPriceSurface AND
	(SELECT count(*) FROM TodaysMarketInflationCapFloorPriceSurfaces WHERE InflationCapFloorPriceSurface = OLD.InflationCapFloorPriceSurface) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.InflationCapFloorPriceSurface id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.InflationCapFloorPriceSurface);
END$$

CREATE TRIGGER InflationCapFloorPriceSpecsCreateD
AFTER DELETE ON TodaysMarketInflationCapFloorPriceSurfaces
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.InflationCapFloorPriceSurface;
END$$



CREATE TRIGGER EquityCurveSpecsCreateI
AFTER INSERT ON TodaysMarketEquityCurves
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.EquityCurve
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.EquityCurve);
END$$

CREATE TRIGGER EquityCurveSpecsCreateU
AFTER UPDATE ON TodaysMarketEquityCurves
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.EquityCurve AND
	(SELECT count(*) FROM TodaysMarketEquityCurves WHERE EquityCurve = OLD.EquityCurve) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.EquityCurve id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.EquityCurve);
END$$

CREATE TRIGGER EquityCurveSpecsCreateD
AFTER DELETE ON TodaysMarketEquityCurves
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.EquityCurve;
END$$



CREATE TRIGGER CDSVolatilitySpecsCreateI
AFTER INSERT ON TodaysMarketCDSVolatilities
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.CDSVolatility
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.CDSVolatility);
END$$

CREATE TRIGGER CDSVolatilitySpecsCreateU
AFTER UPDATE ON TodaysMarketCDSVolatilities
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.CDSVolatility AND
	(SELECT count(*) FROM TodaysMarketCDSVolatilities WHERE CDSVolatility = OLD.CDSVolatility) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.CDSVolatility id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.CDSVolatility);

END$$

CREATE TRIGGER CDSVolatilitySpecsCreateD
AFTER DELETE ON TodaysMarketCDSVolatilities
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.CDSVolatility;
END$$



CREATE TRIGGER EquityVolatilitySpecsCreateI
AFTER INSERT ON TodaysMarketEquityVolatilities
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.EquityVolatility
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.EquityVolatility);
END$$

CREATE TRIGGER EquityVolatilitySpecsCreateU
AFTER UPDATE ON TodaysMarketEquityVolatilities
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.EquityVolatility AND
	(SELECT count(*) FROM TodaysMarketEquityVolatilities WHERE EquityVolatility = OLD.EquityVolatility) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.EquityVolatility id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.EquityVolatility);
END$$

CREATE TRIGGER EquityVolatilitySpecsCreateD
AFTER DELETE ON TodaysMarketEquityVolatilities
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.EquityVolatility;
END$$



CREATE TRIGGER SecuritySpecsCreateI
AFTER INSERT ON TodaysMarketSecurities
FOR EACH ROW
BEGIN
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.Security
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.Security);
END$$

CREATE TRIGGER SecuritySpecsCreateU
AFTER UPDATE ON TodaysMarketSecurities
FOR EACH ROW
BEGIN
	DELETE FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.Security AND
	(SELECT count(*) FROM TodaysMarketSecurities WHERE Security = OLD.Security) = 0;
	
	INSERT TodaysMarketCurveSpecs
	SELECT NEW.Security id
	WHERE NOT exists(SELECT id FROM TodaysMarketCurveSpecs WHERE id = NEW.Security);
END$$

CREATE TRIGGER SecuritySpecsCreateD
AFTER DELETE ON TodaysMarketSecurities
FOR EACH ROW
BEGIN
	DELETE TodaysMarketCurveSpecs
	FROM TodaysMarketCurveSpecs
	WHERE TodaysMarketCurveSpecs.id = OLD.Security;
END$$
