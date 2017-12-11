use ORE
GO

CREATE VIEW TodaysMarketSelection
AS
SELECT DISTINCT tmc.GroupingId,
(SELECT
	(SELECT
		(SELECT
			id [@id],
			YieldCurvesId,
			DiscountingCurvesId,
			IndexForwardingCurvesId,
			SwapIndexCurvesId,
			ZeroInflationIndexCurvesId,
			YYInflationIndexCurvesId,
			FxSpotsId,
			FxVolatilitiesId,
			SwaptionVolatilitiesId,
			CapFloorVolatilitiesId,
			DefaultCurvesId,
			InflationCapFloorPriceSurfacesId,
			EquityCurvesId,
			EquityVolatilitiesId,
			SecuritySpreadsId,
			SecurityRecoveryRatesId
		FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId
		FOR XML PATH ('Configuration'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.YieldCurve [data()] 
			FROM TodaysMarketYieldCurves c WHERE c.id = co.id
			FOR XML PATH ('YieldCurve'), TYPE)
		FROM (SELECT DISTINCT ISNULL(YieldCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('YieldCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.currency [@currency], 
				c.DiscountingCurve [data()] 
			FROM TodaysMarketDiscountingCurves c WHERE c.id = co.id
			FOR XML PATH ('DiscountingCurve'), TYPE)
		FROM (SELECT DISTINCT ISNULL(DiscountingCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('DiscountingCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.IndexName [data()] 
			FROM TodaysMarketIndexForwardingCurves c WHERE c.id = co.id
			FOR XML PATH ('Index'), TYPE)
		FROM (SELECT DISTINCT ISNULL(IndexForwardingCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('IndexForwardingCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.Discounting [Discounting] 
			FROM TodaysMarketSwapIndexCurves c WHERE c.id = co.id
			FOR XML PATH ('SwapIndex'), TYPE)
		FROM (SELECT DISTINCT ISNULL(SwapIndexCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('SwapIndexCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.ZeroInflationIndexCurve [data()] 
			FROM TodaysMarketZeroInflationIndexCurves c WHERE c.id = co.id
			FOR XML PATH ('ZeroInflationIndexCurve'), TYPE)
		FROM (SELECT DISTINCT ISNULL(ZeroInflationIndexCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('ZeroInflationIndexCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.YYInflationIndexCurve [data()] 
			FROM TodaysMarketYYInflationIndexCurves c WHERE c.id = co.id
			FOR XML PATH ('YYInflationIndexCurve'), TYPE)
		FROM (SELECT DISTINCT ISNULL(YYInflationIndexCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('YYInflationIndexCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.pair [@pair],
				c.FxSpot [data()] 
			FROM TodaysMarketFxSpots c WHERE c.id = co.id
			FOR XML PATH ('FxSpot'), TYPE)
		FROM (SELECT DISTINCT ISNULL(FxSpotsId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('FxSpots'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.pair [@pair],
				c.FxVolatility [data()] 
			FROM TodaysMarketFxVolatilities c WHERE c.id = co.id
			FOR XML PATH ('FxVolatility'), TYPE)
		FROM (SELECT DISTINCT ISNULL(FxVolatilitiesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('FxVolatilities'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.currency [@currency], 
				c.SwaptionVolatility [data()] 
			FROM TodaysMarketSwaptionVolatilities c WHERE c.id = co.id
			FOR XML PATH ('SwaptionVolatility'), TYPE)
		FROM (SELECT DISTINCT ISNULL(SwaptionVolatilitiesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('SwaptionVolatilities'), TYPE),
		(SELECT 
			id [@id],
			(SELECT 
				c.currency [@currency], 
				c.CapFloorVolatility [data()] 
			FROM TodaysMarketCapFloorVolatilities c WHERE c.id = co.id
			FOR XML PATH ('CapFloorVolatility'), TYPE)
		FROM (SELECT DISTINCT ISNULL(CapFloorVolatilitiesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('CapFloorVolatilities'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.DefaultCurve [data()] 
			FROM TodaysMarketDefaultCurves c WHERE c.id = co.id
			FOR XML PATH ('DefaultCurve'), TYPE)
		FROM (SELECT DISTINCT ISNULL(DefaultCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('DefaultCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.InflationCapFloorPriceSurface [data()] 
			FROM TodaysMarketInflationCapFloorPriceSurfaces c WHERE c.id = co.id
			FOR XML PATH ('InflationCapFloorPriceSurface'), TYPE)
		FROM (SELECT DISTINCT ISNULL(InflationCapFloorPriceSurfacesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('InflationCapFloorPriceSurfaces'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.EquityCurve [data()] 
			FROM TodaysMarketEquityCurves c WHERE c.id = co.id
			FOR XML PATH ('EquityCurve'), TYPE)
		FROM (SELECT DISTINCT ISNULL(EquityCurvesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('EquityCurves'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.EquityVolatility [data()] 
			FROM TodaysMarketEquityVolatilities c WHERE c.id = co.id
			FOR XML PATH ('EquityVolatility'), TYPE)
		FROM (SELECT DISTINCT ISNULL(EquityVolatilitiesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('EquityVolatilities'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.SecuritySpread [data()] 
			FROM TodaysMarketSecuritySpreads c WHERE c.id = co.id
			FOR XML PATH ('SecuritySpread'), TYPE)
		FROM (SELECT DISTINCT ISNULL(SecuritySpreadsId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('SecuritySpreads'), TYPE),
		(SELECT
			id [@id],
			(SELECT 
				c.name [@name], 
				c.SecurityRecoveryRate [data()] 
			FROM TodaysMarketSecurityRecoveryRates c WHERE c.id = co.id
			FOR XML PATH ('SecurityRecoveryRate'), TYPE)
		FROM (SELECT DISTINCT ISNULL(SecurityRecoveryRatesId,'default') id FROM TodaysMarketConfiguration WHERE GroupingId = tmc.GroupingId) co
		FOR XML PATH ('SecurityRecoveryRates'), TYPE)
	FOR XML PATH('TodaysMarket'))) XMLData
FROM TodaysMarketConfiguration tmc