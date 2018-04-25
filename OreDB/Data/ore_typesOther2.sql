use ORE;

INSERT INTO TypesFactors
SELECT concat('EQ:',t1.CurveId)
  FROM CurveConfigurationEquityCurves t1
  ORDER BY CurveId;