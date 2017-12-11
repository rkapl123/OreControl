use ORE
GO

CREATE VIEW SensitivityanalysisSelection
AS
SELECT s.Id,
	(SELECT
		(SELECT dc.ccy [@ccy],dc.ShiftType,dc.ShiftSize,dc.ShiftTenors
		FROM SensitivityanalysisDiscountCurve dc WHERE dc.AnalysisId = s.Id
		FOR XML PATH ('DiscountCurve'), TYPE) DiscountCurves,
		(SELECT ic.IndexName [@index],ic.ShiftType,ic.ShiftSize,ic.ShiftTenors
		FROM SensitivityanalysisIndexCurve ic WHERE ic.AnalysisId = s.Id
		FOR XML PATH ('IndexCurve'), TYPE) IndexCurves,
		(SELECT yc.Name [@name],yc.ShiftType,yc.ShiftSize,yc.ShiftTenors
		FROM SensitivityanalysisYieldCurve yc WHERE yc.AnalysisId = s.Id
		FOR XML PATH ('YieldCurve'), TYPE) YieldCurves,
		(SELECT fs.ccypair [@ccypair], fs.ShiftType,fs.ShiftSize
		FROM SensitivityanalysisFxSpot fs WHERE fs.AnalysisId = s.Id
		FOR XML PATH ('FxSpot'), TYPE) FxSpots,
		(SELECT fv.ccypair [@ccypair], fv.ShiftType,fv.ShiftSize,fv.ShiftExpiries,fv.ShiftStrikes
		FROM SensitivityanalysisFxVolatility fv WHERE fv.AnalysisId = s.Id
		FOR XML PATH ('FxVolatility'), TYPE) FxVolatilities,
		(SELECT sv.ccy [@ccy], sv.ShiftType,sv.ShiftSize,sv.ShiftExpiries,sv.ShiftTerms,sv.ShiftStrikes
		FROM SensitivityanalysisSwaptionVolatility sv WHERE sv.AnalysisId = s.Id
		FOR XML PATH ('SwaptionVolatility'), TYPE) SwaptionVolatilities,
		(SELECT cv.ccy [@ccy], cv.ShiftType,cv.ShiftSize,cv.ShiftExpiries,cv.ShiftStrikes,cv.IndexName [Index]
		FROM SensitivityanalysisCapFloorVolatility cv WHERE cv.AnalysisId = s.Id
		FOR XML PATH ('CapFloorVolatility'), TYPE) CapFloorVolatilities,
		(SELECT cg.Pair
		FROM SensitivityanalysisCrossgammafilter cg WHERE cg.AnalysisId = s.Id
		FOR XML PATH (''), TYPE) Crossgammafilter
	FOR XML PATH('SensitivityAnalysis')) XMLData
FROM Sensitivityanalysis s