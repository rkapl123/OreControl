use ORE;

INSERT Stresstest (id,GroupingId) VALUES ('15parallel_rates','Example_15');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR','15parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD','15parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP','15parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-6M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-3M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EONIA','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-3M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-6M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-3M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-6M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF-LIBOR-6M','15parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY-LIBOR-6M','15parallel_rates');
INSERT StresstestYieldCurve (ShiftType,Shifts,ShiftTenors,name,StresstestId) VALUES ('Absolute','0.001,0.002,0.003,0.004,0.005,0.006,0.007,0.008,0.009','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','15parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'USDEUR','15parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'GBPEUR','15parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'CHFEUR','15parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'JPYEUR','15parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','USDEUR','15parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','GBPEUR','15parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','JPYEUR','15parallel_rates');
INSERT StresstestSwaptionVolatility (ShiftType,ShiftExpiries,ShiftTerms,ccy,StresstestId) VALUES ('Absolute','1Y,5Y,10Y','5Y','EUR','15parallel_rates');
INSERT StresstestSwaptionShift (Shift,StresstestId,ccy,term,expiry) VALUES (0.0010,'15parallel_rates','EUR','default','default');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','1Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','5Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','10Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','1Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','5Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','10Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','1Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','5Y','15parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','10Y','15parallel_rates','EUR');
INSERT StresstestCapFloorVolatility (ShiftType,Shifts,ShiftExpiries,ccy,StresstestId) VALUES ('Absolute','0.001,0.001,0.001,0.001,0.001,0.001','6M,1Y,2Y,3Y,5Y,10Y','EUR','15parallel_rates');
INSERT StresstestCapFloorVolatility (ShiftType,Shifts,ShiftExpiries,ccy,StresstestId) VALUES ('Absolute','0.001,0.001,0.001,0.001,0.001,0.001','6M,1Y,2Y,3Y,5Y,10Y','USD','15parallel_rates');
INSERT StresstestEquitySpot (ShiftType,ShiftSize,equity,StresstestId) VALUES ('Relative',0.01,'SP5','15parallel_rates');
INSERT StresstestEquitySpot (ShiftType,ShiftSize,equity,StresstestId) VALUES ('Relative',0.01,'Lufthansa','15parallel_rates');
INSERT StresstestEquityVolatility (ShiftType,Shifts,ShiftExpiries,equity,StresstestId) VALUES ('Relative','0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y','SP5','15parallel_rates');
INSERT StresstestEquityVolatility (ShiftType,Shifts,ShiftExpiries,equity,StresstestId) VALUES ('Relative','0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y','Lufthansa','15parallel_rates');
INSERT Stresstest (id,GroupingId) VALUES ('15twist','Example_15');
INSERT StresstestYieldCurve (ShiftType,Shifts,ShiftTenors,name,StresstestId) VALUES ('Absolute','-0.005,-0.004,-0.003,-0.002,0.002,0.004,0.006,0.008,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','15twist');
INSERT StresstestSwaptionVolatility (ShiftType,ShiftExpiries,ShiftTerms,ccy,StresstestId) VALUES ('Absolute','1Y,5Y,10Y','5Y','EUR','15twist');
INSERT StresstestSwaptionShift (Shift,StresstestId,ccy,term,expiry) VALUES (0.0020,'15twist','EUR','default','default');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0040,'1Y','5Y','15twist','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0030,'5Y','5Y','15twist','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','5Y','15twist','EUR');
INSERT Stresstest (id,GroupingId) VALUES ('17parallel_rates','Example_17');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR','17parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD','17parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP','17parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-6M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-3M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EONIA','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-3M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-6M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-3M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-6M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF-LIBOR-6M','17parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY-LIBOR-6M','17parallel_rates');
INSERT StresstestYieldCurve (ShiftType,Shifts,ShiftTenors,name,StresstestId) VALUES ('Absolute','0.001,0.002,0.003,0.004,0.005,0.006,0.007,0.008,0.009','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','17parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'USDEUR','17parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'GBPEUR','17parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'CHFEUR','17parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'JPYEUR','17parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','USDEUR','17parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','GBPEUR','17parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','JPYEUR','17parallel_rates');
INSERT StresstestSwaptionVolatility (ShiftType,ShiftExpiries,ShiftTerms,ccy,StresstestId) VALUES ('Absolute','1Y,5Y,10Y','5Y','EUR','17parallel_rates');
INSERT StresstestSwaptionShift (Shift,StresstestId,ccy,term,expiry) VALUES (0.0010,'17parallel_rates','EUR','default','default');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','1Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','5Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','10Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','1Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','5Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','10Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','1Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','5Y','17parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','10Y','17parallel_rates','EUR');
INSERT StresstestCapFloorVolatility (ShiftType,Shifts,ShiftExpiries,ccy,StresstestId) VALUES ('Absolute','0.001,0.001,0.001,0.001,0.001,0.001','6M,1Y,2Y,3Y,5Y,10Y','EUR','17parallel_rates');
INSERT StresstestCapFloorVolatility (ShiftType,Shifts,ShiftExpiries,ccy,StresstestId) VALUES ('Absolute','0.001,0.001,0.001,0.001,0.001,0.001','6M,1Y,2Y,3Y,5Y,10Y','USD','17parallel_rates');
INSERT StresstestEquitySpot (ShiftType,ShiftSize,equity,StresstestId) VALUES ('Relative',0.01,'SP5','17parallel_rates');
INSERT StresstestEquitySpot (ShiftType,ShiftSize,equity,StresstestId) VALUES ('Relative',0.01,'Lufthansa','17parallel_rates');
INSERT StresstestEquityVolatility (ShiftType,Shifts,ShiftExpiries,equity,StresstestId) VALUES ('Relative','0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y','SP5','17parallel_rates');
INSERT StresstestEquityVolatility (ShiftType,Shifts,ShiftExpiries,equity,StresstestId) VALUES ('Relative','0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y','Lufthansa','17parallel_rates');
INSERT Stresstest (id,GroupingId) VALUES ('17twist','Example_17');
INSERT StresstestYieldCurve (ShiftType,Shifts,ShiftTenors,name,StresstestId) VALUES ('Absolute','-0.005,-0.004,-0.003,-0.002,0.002,0.004,0.006,0.008,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','17twist');
INSERT StresstestSwaptionVolatility (ShiftType,ShiftExpiries,ShiftTerms,ccy,StresstestId) VALUES ('Absolute','1Y,5Y,10Y','5Y','EUR','17twist');
INSERT StresstestSwaptionShift (Shift,StresstestId,ccy,term,expiry) VALUES (0.0020,'17twist','EUR','default','default');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0040,'1Y','5Y','17twist','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0030,'5Y','5Y','17twist','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','5Y','17twist','EUR');
INSERT Stresstest (id,GroupingId) VALUES ('22parallel_rates','Example_22');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR','22parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD','22parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP','22parallel_rates');
INSERT StresstestDiscountCurve (ShiftType,Shifts,ShiftTenors,ccy,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-6M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EURIBOR-3M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','EUR-EONIA','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-3M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','USD-LIBOR-6M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-3M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','GBP-LIBOR-6M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','CHF-LIBOR-6M','22parallel_rates');
INSERT StresstestIndexCurve (ShiftType,Shifts,ShiftTenors,indexName,StresstestId) VALUES ('Absolute','0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','JPY-LIBOR-6M','22parallel_rates');
INSERT StresstestYieldCurve (ShiftType,Shifts,ShiftTenors,name,StresstestId) VALUES ('Absolute','0.001,0.002,0.003,0.004,0.005,0.006,0.007,0.008,0.009','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','22parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'USDEUR','22parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'GBPEUR','22parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'CHFEUR','22parallel_rates');
INSERT StresstestFxSpot (ShiftType,ShiftSize,ccypair,StresstestId) VALUES ('Relative',0.01,'JPYEUR','22parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','USDEUR','22parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','GBPEUR','22parallel_rates');
INSERT StresstestFxVolatility (ShiftType,Shifts,ShiftExpiries,ccypair,StresstestId) VALUES ('Absolute','0.1,0.1,0.1,0.1','1Y,2Y,3Y,5Y','JPYEUR','22parallel_rates');
INSERT StresstestSwaptionVolatility (ShiftType,ShiftExpiries,ShiftTerms,ccy,StresstestId) VALUES ('Absolute','1Y,5Y,10Y','5Y','EUR','22parallel_rates');
INSERT StresstestSwaptionShift (Shift,StresstestId,ccy,term,expiry) VALUES (0.0010,'22parallel_rates','EUR','default','default');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','1Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','5Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'1Y','10Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','1Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','5Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'5Y','10Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','1Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','5Y','22parallel_rates','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','10Y','22parallel_rates','EUR');
INSERT StresstestCapFloorVolatility (ShiftType,Shifts,ShiftExpiries,ccy,StresstestId) VALUES ('Absolute','0.001,0.001,0.001,0.001,0.001,0.001','6M,1Y,2Y,3Y,5Y,10Y','EUR','22parallel_rates');
INSERT StresstestCapFloorVolatility (ShiftType,Shifts,ShiftExpiries,ccy,StresstestId) VALUES ('Absolute','0.001,0.001,0.001,0.001,0.001,0.001','6M,1Y,2Y,3Y,5Y,10Y','USD','22parallel_rates');
INSERT StresstestEquitySpot (ShiftType,ShiftSize,equity,StresstestId) VALUES ('Relative',0.01,'SP5','22parallel_rates');
INSERT StresstestEquitySpot (ShiftType,ShiftSize,equity,StresstestId) VALUES ('Relative',0.01,'Lufthansa','22parallel_rates');
INSERT StresstestEquityVolatility (ShiftType,Shifts,ShiftExpiries,equity,StresstestId) VALUES ('Relative','0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y','SP5','22parallel_rates');
INSERT StresstestEquityVolatility (ShiftType,Shifts,ShiftExpiries,equity,StresstestId) VALUES ('Relative','0.01,0.01,0.01,0.01,0.01','6M,1Y,2Y,3Y,5Y','Lufthansa','22parallel_rates');
INSERT Stresstest (id,GroupingId) VALUES ('22twist','Example_22');
INSERT StresstestYieldCurve (ShiftType,Shifts,ShiftTenors,name,StresstestId) VALUES ('Absolute','-0.005,-0.004,-0.003,-0.002,0.002,0.004,0.006,0.008,0.01','6M,1Y,2Y,3Y,5Y,7Y,10Y,15Y,20Y','BENCHMARK_EUR','22twist');
INSERT StresstestSwaptionVolatility (ShiftType,ShiftExpiries,ShiftTerms,ccy,StresstestId) VALUES ('Absolute','1Y,5Y,10Y','5Y','EUR','22twist');
INSERT StresstestSwaptionShift (Shift,StresstestId,ccy,term,expiry) VALUES (0.0020,'22twist','EUR','default','default');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0040,'1Y','5Y','22twist','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0030,'5Y','5Y','22twist','EUR');
INSERT StresstestSwaptionShift (Shift,expiry,term,StresstestId,ccy) VALUES (0.0010,'10Y','5Y','22twist','EUR');
