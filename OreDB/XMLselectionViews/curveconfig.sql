use ORE
GO
CREATE VIEW CurveConfigSelection
AS
SELECT DISTINCT g.GroupingId,
(SELECT
	(SELECT 
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Dimension,Expiries
		FROM CurveConfigurationFXVolatilities c
		FOR XML PATH ('FXVolatility'), TYPE) FXVolatilities,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Dimension,VolatilityType,Extrapolation,DayCounter,Calendar,BusinessDayConvention,OptionTenors,SwapTenors,ShortSwapIndexBase,SwapIndexBase 
		FROM CurveConfigurationSwaptionVolatilities c
		FOR XML PATH ('SwaptionVolatility'), TYPE) SwaptionVolatilities,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,VolatilityType,Extrapolation,IncludeAtm,DayCounter,Calendar,BusinessDayConvention,Tenors,Strikes,IborIndex,ISNULL(DiscountCurve,'') DiscountCurve
		FROM CurveConfigurationCapFloorVolatilities c
		FOR XML PATH ('CapFloorVolatility'), TYPE) CapFloorVolatilities,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Currency,Type,ISNULL(DiscountCurve,'') DiscountCurve,DayCounter,RecoveryRate,Conventions,
			(SELECT Quote [data()] 
			FROM CurveConfigurationQuotes q WHERE q.CurveId = c.CurveId ORDER by Seq
			FOR XML PATH ('Quote'), TYPE) Quotes
		FROM CurveConfigurationDefaultCurves c
		FOR XML PATH ('DefaultCurve'), TYPE) DefaultCurves,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Currency,ISNULL(DiscountCurve,'') DiscountCurve,
			(SELECT cast('<' + SegmentsType + '>' + 
				convert(varchar(MAX),(SELECT Type,
					ISNULL((SELECT Quote [data()] 
					FROM CurveConfigurationQuotes q WHERE q.CurveId = c.CurveId AND q.Type = si.Type ORDER by Seq
					FOR XML PATH ('Quote'), TYPE), (SELECT '' FOR XML PATH (''), TYPE)) Quotes,
					Conventions,ProjectionCurve,ProjectionCurveLong,ProjectionCurveShort,DiscountCurve,SpotRate,ProjectionCurveDomestic,ProjectionCurveForeign,ReferenceCurve
				FROM CurveConfigurationYieldCurveSegments si WHERE si.CurveId = c.CurveId AND si.Type = s.Type AND si.Seq = s.Seq
				FOR XML PATH(''), TYPE))
			+ '</' + SegmentsType + '>' AS xml) 
			FROM CurveConfigurationYieldCurveSegments s WHERE s.CurveId = c.CurveId ORDER BY s.Seq
			FOR XML PATH(''), TYPE) Segments,
		InterpolationVariable,InterpolationMethod,YieldCurveDayCounter,Tolerance,Extrapolation
		FROM CurveConfigurationYieldCurves c
		FOR XML PATH ('YieldCurve'), TYPE) YieldCurves,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,NominalTermStructure,Type,Conventions,Extrapolation,Calendar,DayCounter,Lag,Frequency,BaseRate,Tolerance,
			(SELECT Quote [data()] 
			FROM CurveConfigurationQuotes q WHERE q.CurveId = c.CurveId ORDER by Seq
			FOR XML PATH ('Quote'), TYPE) Quotes,
			(SELECT CONVERT(varchar,SeasonalityBaseDate,112) BaseDate, SeasonalityFrequency Frequency,
				(SELECT Factor [data()] 
				FROM CurveConfigurationSeasonalityFactors f WHERE f.CurveId = c.CurveId
				FOR XML PATH ('Factor'), TYPE) Factors
			FROM CurveConfigurationInflationCurves ci WHERE ci.CurveId = c.CurveId AND NOT SeasonalityBaseDate IS NULL
			FOR XML PATH (''), TYPE) Seasonality
		FROM CurveConfigurationInflationCurves c
		FOR XML PATH ('InflationCurve'), TYPE) InflationCurves,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Type,StartRate,ObservationLag,Calendar,BusinessDayConvention,DayCounter,IndexName [Index],IndexCurve,IndexInterpolated,YieldTermStructure,CapStrikes,FloorStrikes,Maturities
		FROM CurveConfigurationInflationCapFloorPriceSurfaces c
		FOR XML PATH ('InflationCapFloorPriceSurface'), TYPE) InflationCapFloorPriceSurfaces,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Currency,Type,SpotQuote,DayCounter,
			(SELECT Quote [data()] 
			FROM CurveConfigurationQuotes q WHERE q.CurveId = c.CurveId ORDER by Seq
			FOR XML PATH ('Quote'), TYPE) Quotes
		FROM CurveConfigurationEquityCurves c
		FOR XML PATH ('EquityCurve'), TYPE) EquityCurves,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,Currency,Dimension,Expiries
		FROM CurveConfigurationEquityVolatilities c
		FOR XML PATH ('EquityVolatility'), TYPE) EquityVolatilities,
		(SELECT CurveId,ISNULL(CurveDescription,'') CurveDescription,
			(SELECT Quote [data()] 
			FROM CurveConfigurationQuotes q WHERE q.CurveId = c.CurveId ORDER by Seq
			FOR XML PATH ('Quote'), TYPE) Quotes
		FROM CurveConfigurationSecuritySpreads c
		FOR XML PATH ('SecuritySpread'), TYPE) SecuritySpreads
	FOR XML PATH ('CurveConfiguration'))) XMLData
FROM
(SELECT GroupingId FROM CurveConfigurationFXVolatilities
UNION
SELECT GroupingId FROM CurveConfigurationSwaptionVolatilities
UNION
SELECT GroupingId FROM CurveConfigurationCapFloorVolatilities
UNION
SELECT GroupingId FROM CurveConfigurationDefaultCurves
UNION
SELECT GroupingId FROM CurveConfigurationYieldCurves
UNION
SELECT GroupingId FROM CurveConfigurationInflationCurves
UNION
SELECT GroupingId FROM CurveConfigurationInflationCapFloorPriceSurfaces
UNION
SELECT GroupingId FROM CurveConfigurationEquityCurves
UNION
SELECT GroupingId FROM CurveConfigurationEquityVolatilities
UNION
SELECT GroupingId FROM CurveConfigurationSecuritySpreads) g