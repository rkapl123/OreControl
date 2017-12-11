use ORE
GO

CREATE VIEW StresstestSelection
AS
SELECT DISTINCT so.GroupingId,
	(SELECT
		(SELECT s.Id [@id],
			(SELECT dc.ccy [@ccy],dc.ShiftType,dc.ShiftTenors,dc.Shifts
			FROM StresstestDiscountCurve dc WHERE dc.StresstestId = s.Id
			FOR XML PATH ('DiscountCurve'), TYPE) DiscountCurves,
			(SELECT ic.IndexName [@index],ic.ShiftType,ic.ShiftTenors,ic.Shifts
			FROM StresstestIndexCurve ic WHERE ic.StresstestId = s.Id
			FOR XML PATH ('IndexCurve'), TYPE) IndexCurves,
			(SELECT yc.Name [@name],yc.ShiftType,yc.ShiftTenors,yc.Shifts
			FROM StresstestYieldCurve yc WHERE yc.StresstestId = s.Id
			FOR XML PATH ('YieldCurve'), TYPE) YieldCurves,
			(SELECT fs.ccypair [@ccypair], fs.ShiftType,fs.ShiftSize
			FROM StresstestFxSpot fs WHERE fs.StresstestId = s.Id
			FOR XML PATH ('FxSpot'), TYPE) FxSpots,
			(SELECT fv.ccypair [@ccypair], fv.ShiftType,fv.ShiftExpiries,fv.Shifts
			FROM StresstestFxVolatility fv WHERE fv.StresstestId = s.Id
			FOR XML PATH ('FxVolatility'), TYPE) FxVolatilities,
			(SELECT sv.ccy [@ccy], sv.ShiftType,sv.ShiftExpiries,sv.ShiftTerms,
				(SELECT CASE WHEN sh.term <> 'default' THEN sh.term END [@term], CASE WHEN sh.expiry <> 'default' THEN sh.expiry END [@expiry], sh.Shift [data()]
				FROM StresstestSwaptionShift sh WHERE sh.StresstestId = sv.StresstestId AND sh.ccy = sv.ccy
				FOR XML PATH ('Shift'), TYPE) Shifts
			FROM StresstestSwaptionVolatility sv WHERE sv.StresstestId = s.Id
			FOR XML PATH ('SwaptionVolatility'), TYPE) SwaptionVolatilities,
			(SELECT cv.ccy [@ccy], cv.ShiftType,cv.ShiftExpiries,cv.Shifts
			FROM StresstestCapFloorVolatility cv WHERE cv.StresstestId = s.Id
			FOR XML PATH ('CapFloorVolatility'), TYPE) CapFloorVolatilities
		FROM Stresstest s where s.GroupingId = so.GroupingId
		FOR XML PATH('Stresstest'), TYPE)
	FOR XML PATH('Stresstesting')) XMLData
FROM Stresstest so