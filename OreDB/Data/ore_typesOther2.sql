USE ORE

INSERT INTO TypesFactors
SELECT 'EQ:'+t1.[CurveId]
  FROM [dbo].[CurveConfigurationEquityCurves] t1
  ORDER BY CurveId