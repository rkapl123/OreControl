use ORE;

INSERT Sensitivityanalysis (Id) VALUES ('Example_15');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR','Example_15');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD','Example_15');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP','Example_15');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF','Example_15');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-6M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-3M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EONIA','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-3M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-6M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-3M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-6M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF-LIBOR-6M','Example_15');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY-LIBOR-6M','Example_15');
INSERT SensitivityanalysisYieldCurve (ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','Example_15');
INSERT SensitivityanalysisYieldCurve (CurveType,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EquityForecast','Absolute',0.0001,'6M,1Y,2Y,3Y,4Y,5Y,7Y,10Y','SP5','Example_15');
INSERT SensitivityanalysisYieldCurve (CurveType,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EquityForecast','Absolute',0.0001,'6M,1Y,2Y,3Y,4Y,5Y,7Y,10Y','Lufthansa','Example_15');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'USDEUR','Example_15');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'GBPEUR','Example_15');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'CHFEUR','Example_15');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'JPYEUR','Example_15');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','USDEUR','Example_15');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','GBPEUR','Example_15');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','JPYEUR','Example_15');
INSERT SensitivityanalysisSwaptionVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftTerms,ccy,AnalysisId) VALUES ('Relative',0.01,'1Y,5Y,7Y,10Y','1Y,5Y,10Y','EUR','Example_15');
INSERT SensitivityanalysisCapFloorVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftStrikes,IndexName,ccy,AnalysisId) VALUES ('Absolute',0.0001,'1Y,2Y,3Y,5Y,7Y,10Y','0.01,0.02,0.03,0.04,0.05','EUR-EURIBOR-6M','EUR','Example_15');
INSERT SensitivityanalysisCapFloorVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftStrikes,IndexName,ccy,AnalysisId) VALUES ('Absolute',0.0001,'1Y,2Y,3Y,5Y,7Y,10Y','0.01,0.02,0.03,0.04,0.05','USD-LIBOR-3M','USD','Example_15');
INSERT SensitivityanalysisCreditCurve (Currency,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EUR','Absolute',0.0001,'6M,1Y,2Y,5Y,10Y','CPTY_C','Example_15');
INSERT SensitivityanalysisCreditCurve (Currency,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('USD','Absolute',0.0001,'6M,1Y,2Y,5Y,10Y','BANK','Example_15');
INSERT SensitivityanalysisEquitySpot (ShiftType,ShiftSize,equity,AnalysisId) VALUES ('Relative',0.01,'SP5','Example_15');
INSERT SensitivityanalysisEquitySpot (ShiftType,ShiftSize,equity,AnalysisId) VALUES ('Relative',0.01,'Lufthansa','Example_15');
INSERT SensitivityanalysisEquityVolatility (ShiftType,ShiftSize,ShiftExpiries,equity,AnalysisId) VALUES ('Relative',0.01,'6M,1Y,2Y,3Y,5Y','SP5','Example_15');
INSERT SensitivityanalysisEquityVolatility (ShiftType,ShiftSize,ShiftExpiries,equity,AnalysisId) VALUES ('Relative',0.01,'6M,1Y,2Y,3Y,5Y','Lufthansa','Example_15');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUHICP','Example_15');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUHICPXT','Example_15');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','FRHICP','Example_15');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','UKRPI','Example_15');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USCPI','Example_15');
INSERT SensitivityanalysisYYInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUHICPXT','Example_15');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('DiscountCurve/EUR,DiscountCurve/EUR','Example_15');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('IndexCurve/EUR,IndexCurve/EUR','Example_15');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('DiscountCurve/EUR,IndexCurve/EUR','Example_15');
INSERT Sensitivityanalysis (Id) VALUES ('Example_17');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR','Example_17');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD','Example_17');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP','Example_17');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF','Example_17');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-6M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-3M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EONIA','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-3M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-6M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-3M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-6M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF-LIBOR-6M','Example_17');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY-LIBOR-6M','Example_17');
INSERT SensitivityanalysisYieldCurve (ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','Example_17');
INSERT SensitivityanalysisYieldCurve (CurveType,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EquityForecast','Absolute',0.0001,'6M,1Y,2Y,3Y,4Y,5Y,7Y,10Y','SP5','Example_17');
INSERT SensitivityanalysisYieldCurve (CurveType,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EquityForecast','Absolute',0.0001,'6M,1Y,2Y,3Y,4Y,5Y,7Y,10Y','Lufthansa','Example_17');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'USDEUR','Example_17');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'GBPEUR','Example_17');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'CHFEUR','Example_17');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'JPYEUR','Example_17');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','USDEUR','Example_17');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','GBPEUR','Example_17');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','JPYEUR','Example_17');
INSERT SensitivityanalysisSwaptionVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftTerms,ccy,AnalysisId) VALUES ('Relative',0.01,'1Y,5Y,7Y,10Y','1Y,5Y,10Y','EUR','Example_17');
INSERT SensitivityanalysisCapFloorVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftStrikes,IndexName,ccy,AnalysisId) VALUES ('Absolute',0.0001,'1Y,2Y,3Y,5Y,7Y,10Y','0.01,0.02,0.03,0.04,0.05','EUR-EURIBOR-6M','EUR','Example_17');
INSERT SensitivityanalysisCapFloorVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftStrikes,IndexName,ccy,AnalysisId) VALUES ('Absolute',0.0001,'1Y,2Y,3Y,5Y,7Y,10Y','0.01,0.02,0.03,0.04,0.05','USD-LIBOR-3M','USD','Example_17');
INSERT SensitivityanalysisCreditCurve (Currency,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EUR','Absolute',0.0001,'6M,1Y,2Y','CPTY_C','Example_17');
INSERT SensitivityanalysisEquitySpot (ShiftType,ShiftSize,equity,AnalysisId) VALUES ('Relative',0.01,'SP5','Example_17');
INSERT SensitivityanalysisEquitySpot (ShiftType,ShiftSize,equity,AnalysisId) VALUES ('Relative',0.01,'Lufthansa','Example_17');
INSERT SensitivityanalysisEquityVolatility (ShiftType,ShiftSize,ShiftExpiries,equity,AnalysisId) VALUES ('Relative',0.01,'6M,1Y,2Y,3Y,5Y','SP5','Example_17');
INSERT SensitivityanalysisEquityVolatility (ShiftType,ShiftSize,ShiftExpiries,equity,AnalysisId) VALUES ('Relative',0.01,'6M,1Y,2Y,3Y,5Y','Lufthansa','Example_17');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUHICP','Example_17');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUHICPXT','Example_17');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','FRHICP','Example_17');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','UKRPI','Example_17');
INSERT SensitivityanalysisZeroInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USCPI','Example_17');
INSERT SensitivityanalysisYYInflationIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUHICPXT','Example_17');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('DiscountCurve/EUR,DiscountCurve/EUR','Example_17');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('IndexCurve/EUR,IndexCurve/EUR','Example_17');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('DiscountCurve/EUR,IndexCurve/EUR','Example_17');
INSERT Sensitivityanalysis (Id) VALUES ('Example_22');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR','Example_22');
INSERT SensitivityanalysisDiscountCurve (ShiftType,ShiftSize,ShiftTenors,ccy,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD','Example_22');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-6M','Example_22');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-3M','Example_22');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EONIA','Example_22');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-3M','Example_22');
INSERT SensitivityanalysisIndexCurve (ShiftType,ShiftSize,ShiftTenors,indexName,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-6M','Example_22');
INSERT SensitivityanalysisYieldCurve (ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('Absolute',0.0001,'6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','Example_22');
INSERT SensitivityanalysisYieldCurve (CurveType,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EquityForecast','Absolute',0.0001,'6M,1Y,2Y,3Y,4Y,5Y,7Y,10Y','SP5','Example_22');
INSERT SensitivityanalysisYieldCurve (CurveType,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EquityForecast','Absolute',0.0001,'6M,1Y,2Y,3Y,4Y,5Y,7Y,10Y','Lufthansa','Example_22');
INSERT SensitivityanalysisFxSpot (ShiftType,ShiftSize,ccypair,AnalysisId) VALUES ('Relative',0.01,'USDEUR','Example_22');
INSERT SensitivityanalysisFxVolatility (ShiftType,ShiftSize,ShiftExpiries,ccypair,AnalysisId) VALUES ('Relative',0.01,'1Y,2Y,3Y,5Y','USDEUR','Example_22');
INSERT SensitivityanalysisSwaptionVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftTerms,ccy,AnalysisId) VALUES ('Relative',0.01,'1Y,5Y,7Y,10Y','1Y,5Y,10Y','EUR','Example_22');
INSERT SensitivityanalysisCapFloorVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftStrikes,IndexName,ccy,AnalysisId) VALUES ('Absolute',0.0001,'1Y,2Y,3Y,5Y,7Y,10Y','0.01,0.02,0.03,0.04,0.05','EUR-EURIBOR-6M','EUR','Example_22');
INSERT SensitivityanalysisCapFloorVolatility (ShiftType,ShiftSize,ShiftExpiries,ShiftStrikes,IndexName,ccy,AnalysisId) VALUES ('Absolute',0.0001,'1Y,2Y,3Y,5Y,7Y,10Y','0.01,0.02,0.03,0.04,0.05','USD-LIBOR-3M','USD','Example_22');
INSERT SensitivityanalysisCreditCurve (Currency,ShiftType,ShiftSize,ShiftTenors,name,AnalysisId) VALUES ('EUR','Absolute',0.0001,'6M,1Y,2Y','CPTY_C','Example_22');
INSERT SensitivityanalysisEquitySpot (ShiftType,ShiftSize,equity,AnalysisId) VALUES ('Relative',0.01,'SP5','Example_22');
INSERT SensitivityanalysisEquitySpot (ShiftType,ShiftSize,equity,AnalysisId) VALUES ('Relative',0.01,'Lufthansa','Example_22');
INSERT SensitivityanalysisEquityVolatility (ShiftType,ShiftSize,ShiftExpiries,equity,AnalysisId) VALUES ('Relative',0.01,'6M,1Y,2Y,3Y,5Y','SP5','Example_22');
INSERT SensitivityanalysisEquityVolatility (ShiftType,ShiftSize,ShiftExpiries,equity,AnalysisId) VALUES ('Relative',0.01,'6M,1Y,2Y,3Y,5Y','Lufthansa','Example_22');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('DiscountCurve/EUR,DiscountCurve/EUR','Example_22');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('IndexCurve/EUR,IndexCurve/EUR','Example_22');
INSERT SensitivityanalysisCrossGammaFilter (Pair,AnalysisId) VALUES ('DiscountCurve/EUR,IndexCurve/EUR','Example_22');
