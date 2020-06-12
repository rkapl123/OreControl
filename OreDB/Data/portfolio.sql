use ORE;

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','1Swap_20','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swap_20','Example_1');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1001,'1Swap_20');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20151028','20351028','1Y','TARGET','F','F','Forward',1001,1000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1002,'1Swap_20','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20151028','20351028','6M','TARGET','MF','MF','Forward',1002,1001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_1_19','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_1_19','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_1_19','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20161028','1Swaption_1_19');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1003,'1Swaption_1_19');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1003,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20161028','20351028','1Y','TARGET','F','F','Forward',1003,1002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1004,'1Swaption_1_19','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1004,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20161028','20351028','6M','TARGET','MF','MF','Forward',1004,1003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_2_18','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_2_18','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_2_18','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20171028','1Swaption_2_18');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1005,'1Swaption_2_18');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1005,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20171028','20351028','1Y','TARGET','F','F','Forward',1005,1004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1006,'1Swaption_2_18','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1006,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20171028','20351028','6M','TARGET','MF','MF','Forward',1006,1005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_4_16','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_4_16','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_4_16','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20191028','1Swaption_4_16');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1007,'1Swaption_4_16');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1007,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1007,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20191028','20351028','1Y','TARGET','F','F','Forward',1007,1006);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1008,'1Swaption_4_16','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1008,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1008,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20191028','20351028','6M','TARGET','MF','MF','Forward',1008,1007);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_6_14','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_6_14','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_6_14','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20211028','1Swaption_6_14');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1009,'1Swaption_6_14');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1009,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1009,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20211028','20351028','1Y','TARGET','F','F','Forward',1009,1008);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1010,'1Swaption_6_14','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1010,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1010,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20211028','20351028','6M','TARGET','MF','MF','Forward',1010,1009);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_8_12','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_8_12','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_8_12','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20231028','1Swaption_8_12');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1011,'1Swaption_8_12');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1011,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1011,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20231028','20351028','1Y','TARGET','F','F','Forward',1011,1010);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1012,'1Swaption_8_12','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1012,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1012,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20231028','20351028','6M','TARGET','MF','MF','Forward',1012,1011);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_10_10','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_10_10','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_10_10','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20251028','1Swaption_10_10');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1013,'1Swaption_10_10');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1013,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1013,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20251028','20351028','1Y','TARGET','F','F','Forward',1013,1012);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1014,'1Swaption_10_10','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1014,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1014,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20251028','20351028','6M','TARGET','MF','MF','Forward',1014,1013);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_12_8','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_12_8','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_12_8','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20271028','1Swaption_12_8');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1015,'1Swaption_12_8');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1015,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1015,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20271028','20351028','1Y','TARGET','F','F','Forward',1015,1014);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1016,'1Swaption_12_8','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1016,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1016,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20271028','20351028','6M','TARGET','MF','MF','Forward',1016,1015);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_14_6','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_14_6','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_14_6','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20291028','1Swaption_14_6');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1017,'1Swaption_14_6');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1017,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1017,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20291028','20351028','1Y','TARGET','F','F','Forward',1017,1016);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1018,'1Swaption_14_6','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1018,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1018,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20291028','20351028','6M','TARGET','MF','MF','Forward',1018,1017);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_16_4','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_16_4','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_16_4','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20311028','1Swaption_16_4');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1019,'1Swaption_16_4');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1019,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1019,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20311028','20351028','1Y','TARGET','F','F','Forward',1019,1018);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1020,'1Swaption_16_4','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1020,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1020,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20311028','20351028','6M','TARGET','MF','MF','Forward',1020,1019);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_18_2','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_18_2','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_18_2','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20331028','1Swaption_18_2');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1021,'1Swaption_18_2');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1021,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1021,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20331028','20351028','1Y','TARGET','F','F','Forward',1021,1020);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1022,'1Swaption_18_2','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1022,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1022,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20331028','20351028','6M','TARGET','MF','MF','Forward',1022,1021);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','1Swaption_19_1','CPTY_A','1CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('1Swaption_19_1','Example_1');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('1Swaption_19_1','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20341028','1Swaption_19_1');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',1023,'1Swaption_19_1');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1023,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,1023,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20341028','20351028','1Y','TARGET','F','F','Forward',1023,1022);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',1024,'1Swaption_19_1','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,1024,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,1024,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20341028','20351028','6M','TARGET','MF','MF','Forward',1024,1023);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','2Swap_20','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swap_20','Example_2');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2001,'2Swap_20');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20151028','20351028','1Y','TARGET','F','F','Forward',2001,2000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2002,'2Swap_20','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20151028','20351028','6M','TARGET','MF','MF','Forward',2002,2001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_1_19','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_1_19','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_1_19','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20161028','2Swaption_1_19');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2003,'2Swaption_1_19');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2003,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20161028','20351028','1Y','TARGET','F','F','Forward',2003,2002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2004,'2Swaption_1_19','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2004,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20161028','20351028','6M','TARGET','MF','MF','Forward',2004,2003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_2_18','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_2_18','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_2_18','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20171028','2Swaption_2_18');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2005,'2Swaption_2_18');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2005,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20171028','20351028','1Y','TARGET','F','F','Forward',2005,2004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2006,'2Swaption_2_18','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2006,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20171028','20351028','6M','TARGET','MF','MF','Forward',2006,2005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_4_16','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_4_16','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_4_16','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20191028','2Swaption_4_16');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2007,'2Swaption_4_16');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2007,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2007,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20191028','20351028','1Y','TARGET','F','F','Forward',2007,2006);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2008,'2Swaption_4_16','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2008,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2008,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20191028','20351028','6M','TARGET','MF','MF','Forward',2008,2007);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_6_14','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_6_14','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_6_14','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20211028','2Swaption_6_14');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2009,'2Swaption_6_14');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2009,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2009,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20211028','20351028','1Y','TARGET','F','F','Forward',2009,2008);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2010,'2Swaption_6_14','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2010,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2010,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20211028','20351028','6M','TARGET','MF','MF','Forward',2010,2009);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_8_12','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_8_12','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_8_12','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20231028','2Swaption_8_12');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2011,'2Swaption_8_12');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2011,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2011,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20231028','20351028','1Y','TARGET','F','F','Forward',2011,2010);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2012,'2Swaption_8_12','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2012,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2012,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20231028','20351028','6M','TARGET','MF','MF','Forward',2012,2011);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_10_10','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_10_10','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_10_10','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20251028','2Swaption_10_10');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2013,'2Swaption_10_10');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2013,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2013,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20251028','20351028','1Y','TARGET','F','F','Forward',2013,2012);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2014,'2Swaption_10_10','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2014,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2014,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20251028','20351028','6M','TARGET','MF','MF','Forward',2014,2013);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_12_8','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_12_8','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_12_8','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20271028','2Swaption_12_8');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2015,'2Swaption_12_8');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2015,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2015,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20271028','20351028','1Y','TARGET','F','F','Forward',2015,2014);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2016,'2Swaption_12_8','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2016,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2016,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20271028','20351028','6M','TARGET','MF','MF','Forward',2016,2015);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_14_6','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_14_6','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_14_6','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20291028','2Swaption_14_6');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2017,'2Swaption_14_6');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2017,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2017,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20291028','20351028','1Y','TARGET','F','F','Forward',2017,2016);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2018,'2Swaption_14_6','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2018,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2018,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20291028','20351028','6M','TARGET','MF','MF','Forward',2018,2017);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_16_4','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_16_4','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_16_4','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20311028','2Swaption_16_4');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2019,'2Swaption_16_4');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2019,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2019,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20311028','20351028','1Y','TARGET','F','F','Forward',2019,2018);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2020,'2Swaption_16_4','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2020,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2020,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20311028','20351028','6M','TARGET','MF','MF','Forward',2020,2019);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_18_2','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_18_2','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_18_2','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20331028','2Swaption_18_2');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2021,'2Swaption_18_2');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2021,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2021,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20331028','20351028','1Y','TARGET','F','F','Forward',2021,2020);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2022,'2Swaption_18_2','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2022,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2022,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20331028','20351028','6M','TARGET','MF','MF','Forward',2022,2021);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','2Swaption_19_1','CPTY_A','2CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('2Swaption_19_1','Example_2');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('2Swaption_19_1','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20341028','2Swaption_19_1');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',2023,'2Swaption_19_1');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2023,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,2023,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20341028','20351028','1Y','TARGET','F','F','Forward',2023,2022);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',2024,'2Swaption_19_1','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,2024,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,2024,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20341028','20351028','6M','TARGET','MF','MF','Forward',2024,2023);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','3SwaptionCash','CPTY_A','3CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('3SwaptionCash','Example_3');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('3SwaptionCash','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','3SwaptionCash');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',3001,'3SwaptionCash','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3001,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,3001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',3001,3000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',3002,'3SwaptionCash');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,3002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',3002,3001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','3SwaptionPhysical','CPTY_A','3CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('3SwaptionPhysical','Example_3');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('3SwaptionPhysical','Long','Call','European','Physical','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','3SwaptionPhysical');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',3003,'3SwaptionPhysical','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3003,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,3003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',3003,3002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',3004,'3SwaptionPhysical');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3004,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,3004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',3004,3003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','3Swap','CPTY_A','3CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('3Swap','Example_3');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',3005,'3Swap','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3005,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,3005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',3005,3004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',3006,'3Swap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3006,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,3006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',3006,3005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','3SwaptionCashPremium','CPTY_A','3CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('3SwaptionCashPremium','Example_3');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('3SwaptionCashPremium','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','3SwaptionCashPremium');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',3007,'3SwaptionCashPremium','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3007,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,3007,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',3007,3006);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',3008,'3SwaptionCashPremium');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3008,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,3008,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',3008,3007);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','3SwaptionPhysicalPremium','CPTY_A','3CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('3SwaptionPhysicalPremium','Example_3');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('3SwaptionPhysicalPremium','Long','Call','European','Physical','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','3SwaptionPhysicalPremium');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',3009,'3SwaptionPhysicalPremium','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3009,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,3009,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',3009,3008);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',3010,'3SwaptionPhysicalPremium');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',3010,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,3010,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',3010,3009);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','4SwaptionCash','CPTY_A','4CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('4SwaptionCash','Example_4');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('4SwaptionCash','Long','Call','Bermudan','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-02-25','4SwaptionCash');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2027-02-25','4SwaptionCash');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2028-02-25','4SwaptionCash');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2029-02-25','4SwaptionCash');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2030-02-25','4SwaptionCash');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',4001,'4SwaptionCash','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',4001,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,4001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','Following','Following','Forward',4001,4000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',4002,'4SwaptionCash');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',4002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,4002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',4002,4001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','4SwaptionPhysical','CPTY_A','4CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('4SwaptionPhysical','Example_4');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('4SwaptionPhysical','Long','Call','Bermudan','Physical','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-02-25','4SwaptionPhysical');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2027-02-25','4SwaptionPhysical');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2028-02-25','4SwaptionPhysical');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2029-02-25','4SwaptionPhysical');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2030-02-25','4SwaptionPhysical');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',4003,'4SwaptionPhysical','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',4003,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,4003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','Following','Following','Forward',4003,4002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',4004,'4SwaptionPhysical');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',4004,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,4004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',4004,4003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','4Swap','CPTY_A','4CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('4Swap','Example_4');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',4005,'4Swap','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',4005,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,4005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',4005,4004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',4006,'4Swap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',4006,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,4006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2026-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',4006,4005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','5Swap','CPTY_A','5CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('5Swap','Example_5');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',5001,'5Swap','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',5001,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,5001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2010-10-01','2038-10-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',5001,5000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',5002,'5Swap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',5002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,5002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2010-10-01','2038-10-01','1Y','TARGET','Following','Following','Forward',5002,5001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','5Swaption','CPTY_A','5CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('5Swaption','Example_5');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('5Swaption','Short','Call','European','Physical','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2017-10-01','5Swaption');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',5003,'5Swaption','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',5003,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,5003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2017-10-01','2038-10-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',5003,5002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',5004,'5Swaption');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',5004,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,5004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2017-10-01','2038-10-01','1Y','TARGET','Following','Following','Forward',5004,5003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','5ShortSwap','CPTY_B','5CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('5ShortSwap','Example_5');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',5005,'5ShortSwap','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',5005,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0,5005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2010-10-01','2017-10-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',5005,5004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',5006,'5ShortSwap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',5006,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,5006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2010-10-01','2017-10-01','1Y','TARGET','Following','Following','Forward',5006,5005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxForward','7FXFWD_EURUSD_10Y','CPTY_A','7CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('7FXFWD_EURUSD_10Y','Example_7');
INSERT PortfolioFxForwardData (ValueDate,BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId) VALUES ('2026-03-01','EUR',1000000,'USD',1100000,'7FXFWD_EURUSD_10Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxOption','7FX_CALL_OPTION_EURUSD_10Y','CPTY_A','7CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('7FX_CALL_OPTION_EURUSD_10Y','Example_7');
INSERT PortfolioFxOptionData (BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('EUR',1000000,'USD',1100000,'7FX_CALL_OPTION_EURUSD_10Y','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','7FX_CALL_OPTION_EURUSD_10Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxOption','7FX_PUT_OPTION_EURUSD_10Y','CPTY_A','7CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('7FX_PUT_OPTION_EURUSD_10Y','Example_7');
INSERT PortfolioFxOptionData (BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('EUR',1000000,'USD',1100000,'7FX_PUT_OPTION_EURUSD_10Y','Long','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','7FX_PUT_OPTION_EURUSD_10Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','8CCSwap','CPTY_A','8CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('8CCSwap','Example_8');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',8001,'8CCSwap','true','true','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',8001,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,8001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2015-03-01','2036-03-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',8001,8000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange) VALUES ('Fixed','false','USD','ACT/ACT','Following',8002,'8CCSwap','true','true');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('11000000',8002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,8002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2015-03-01','2036-03-01','1Y','TARGET','Following','Following','Forward',8002,8001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','10Swap_1','CPTY_A','10CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('10Swap_1','Example_10');
INSERT PortfolioTradeActions (Type,Owner,Id,TradeId) VALUES ('Break','Mutual',10000,'10Swap_1');
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,TradeActionId,Id) VALUES ('2005-03-03','2027-03-03','5Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',10000,10000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','true','GBP','A365','ModifiedFollowing',10001,'10Swap_1');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('40000000',10001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.018,10001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,FirstDate,LegDataId,Id) VALUES ('2005-03-03','2027-03-03','6M','UK','ModifiedFollowing','ModifiedFollowing','Forward','2005-09-05',10001,10001);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','false','GBP','A365','ModifiedFollowing',10002,'10Swap_1','GBP-LIBOR-6M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('40000000',10002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,10002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,FirstDate,LegDataId,Id) VALUES ('2005-03-03','2027-03-03','6M','UK','ModifiedFollowing','ModifiedFollowing','Forward','2005-09-05',10002,10002);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','10Swap_3','CPTY_A','10CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('10Swap_3','Example_10');
INSERT PortfolioTradeActions (Type,Owner,Id,TradeId) VALUES ('Break','Mutual',10001,'10Swap_3');
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,TradeActionId,Id) VALUES ('2015-04-22','2024-11-01','5Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',10001,10003);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','USD','A360','ModifiedFollowing',10003,'10Swap_3');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('50000000',10003,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,10003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2015-04-22','2024-11-01','3M','UK','ModifiedFollowing','ModifiedFollowing','Forward',10003,10004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','USD','A360','ModifiedFollowing',10004,'10Swap_3','USD-LIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('50000000',10004,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,10004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2015-04-22','2024-11-01','3M','UK','ModifiedFollowing','ModifiedFollowing','Forward',10004,10005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','10Swap_2','CPTY_A','10CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('10Swap_2','Example_10');
INSERT PortfolioTradeActions (Type,Owner,Id,TradeId) VALUES ('Break','Mutual',10002,'10Swap_2');
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,TradeActionId,Id) VALUES ('2012-09-05','2026-09-05','5Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',10002,10006);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',10005,'10Swap_2','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('30000000',10005,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,10005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2012-09-05','2026-09-05','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',10005,10007);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','T360','ModifiedFollowing',10006,'10Swap_2');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('30000000',10006,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.01,10006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2012-09-05','2026-09-05','1Y','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',10006,10008);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','11Swap','CPTY_A','11CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('11Swap','Example_11');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',11001,'11Swap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,11001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,11001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160301','20360301','1Y','TARGET','F','F','Forward',11001,11000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',11002,'11Swap','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,11002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,11002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160301','20360301','6M','TARGET','MF','MF','Forward',11002,11001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','15SWAP_EUR','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15SWAP_EUR','Example_15');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',15001,'15SWAP_EUR');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,15001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.009851,15001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20360209','1Y','TARGET','F','F','Forward',15001,15000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',15002,'15SWAP_EUR','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,15002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,15002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20360209','6M','TARGET','MF','MF','Forward',15002,15001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','15CC_SWAP_EUR_USD','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15CC_SWAP_EUR_USD','Example_15');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','USD','A360','MF',15003,'15CC_SWAP_EUR_USD','true','true','USD-LIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,15003,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,15003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','6M','TARGET','MF','MF','Forward',15003,15002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',15004,'15CC_SWAP_EUR_USD','true','true','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (88312931.57,15004,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.015,15004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','6M','TARGET','MF','MF','Forward',15004,15003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','15CC_SWAP_EUR_USD_RESET','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15CC_SWAP_EUR_USD_RESET','Example_15');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','USD','A360','MF',15005,'15CC_SWAP_EUR_USD_RESET','true','true','USD-LIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,15005,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,15005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','6M','TARGET','MF','MF','Forward',15005,15004);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FXResetForeignCurrency,FXResetForeignAmount,FXResetFXIndex,FXResetFixingDays,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',15006,'15CC_SWAP_EUR_USD_RESET','true','true','USD',100000000,'FX-ECB-EUR-USD',2,'EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (88312931.57,15006,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.015,15006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','6M','TARGET','MF','MF','Forward',15006,15005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxForward','15FXFWD_EURUSD_10Y','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15FXFWD_EURUSD_10Y','Example_15');
INSERT PortfolioFxForwardData (ValueDate,BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId) VALUES ('2026-03-01','EUR',1000000,'USD',1100000,'15FXFWD_EURUSD_10Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxOption','15FX_CALL_OPTION','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15FX_CALL_OPTION','Example_15');
INSERT PortfolioFxOptionData (BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('EUR',1000000,'USD',1100000,'15FX_CALL_OPTION','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','15FX_CALL_OPTION');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxOption','15FX_PUT_OPTION','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15FX_PUT_OPTION','Example_15');
INSERT PortfolioFxOptionData (BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('EUR',1000000,'USD',1100000,'15FX_PUT_OPTION','Long','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','15FX_PUT_OPTION');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','15EUROPEAN_SWAPTION','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EUROPEAN_SWAPTION','Example_15');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('15EUROPEAN_SWAPTION','Short','Call','European','Physical','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2028-10-01','15EUROPEAN_SWAPTION');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',15007,'15EUROPEAN_SWAPTION','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15007,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,15007,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2028-10-01','2038-10-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',15007,15006);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',15008,'15EUROPEAN_SWAPTION');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15008,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,15008,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2028-10-01','2038-10-01','1Y','TARGET','Following','Following','Forward',15008,15007);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','15BERMUDAN_SWAPTION','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15BERMUDAN_SWAPTION','Example_15');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('15BERMUDAN_SWAPTION','Short','Call','Bermudan','Physical','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2028-10-01','15BERMUDAN_SWAPTION');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2029-10-01','15BERMUDAN_SWAPTION');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2030-10-01','15BERMUDAN_SWAPTION');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2031-10-01','15BERMUDAN_SWAPTION');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2032-10-01','15BERMUDAN_SWAPTION');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2033-10-01','15BERMUDAN_SWAPTION');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName) VALUES ('Floating','true','EUR','A360','ModifiedFollowing',15009,'15BERMUDAN_SWAPTION','EUR-EURIBOR-3M');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15009,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,15009,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2028-10-01','2038-10-01','3M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',15009,15008);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','Following',15010,'15BERMUDAN_SWAPTION');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15010,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,15010,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2028-10-01','2038-10-01','1Y','TARGET','Following','Following','Forward',15010,15009);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CapFloor','15CAP_USD','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15CAP_USD','Example_15');
INSERT PortfolioCapFloorData (LongShort,TradeId) VALUES ('Short','15CAP_USD');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','USD','ACT/360','MF',15011,'15CAP_USD','USD-LIBOR-3M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (1000000.00,15011,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0,15011,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20260209','3M','US','MF','MF','Forward',15011,15010);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CapFloor','15FLOOR_USD','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15FLOOR_USD','Example_15');
INSERT PortfolioCapFloorData (LongShort,TradeId) VALUES ('Long','15FLOOR_USD');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','USD','ACT/360','MF',15012,'15FLOOR_USD','USD-LIBOR-3M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (1000000.00,15012,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0,15012,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20260209','3M','US','MF','MF','Forward',15012,15011);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CapFloor','15CAP_EUR','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15CAP_EUR','Example_15');
INSERT PortfolioCapFloorData (LongShort,TradeId) VALUES ('Short','15CAP_EUR');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','ACT/360','MF',15013,'15CAP_EUR','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (1000000.00,15013,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0,15013,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20260209','6M','TARGET','MF','MF','Forward',15013,15012);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CapFloor','15FLOOR_EUR','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15FLOOR_EUR','Example_15');
INSERT PortfolioCapFloorData (LongShort,TradeId) VALUES ('Long','15FLOOR_EUR');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','ACT/360','MF',15014,'15FLOOR_EUR','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (1000000.00,15014,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0,15014,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20260209','6M','TARGET','MF','MF','Forward',15014,15013);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Bond','15BOND','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15BOND','Example_15');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','BENCHMARK_EUR',2,'TARGET','20160203','15BOND');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',15015,'15BOND');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,15015,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,15015,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',15015,15014);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','15Bond_Floating','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15Bond_Floating','Example_15');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','15Bond_Floating');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','EUR','ACT/ACT','F',15016,'15Bond_Floating','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,15016,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.01,15016,0);
INSERT PortfolioFloatingLegFloors (Floor,LegDataId,SeqId) VALUES (0.0150,15016,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','6M','TARGET','F','F','Forward',15016,15015);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','15EQ_CALL_SP5','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EQ_CALL_SP5','Example_15');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('SP5','USD',2147.56,775,'15EQ_CALL_SP5','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-02-05','15EQ_CALL_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','15EQ_PUT_SP5','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EQ_PUT_SP5','Example_15');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('SP5','USD',2147.56,775,'15EQ_PUT_SP5','Short','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-02-05','15EQ_PUT_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityForward','15EQ_FWD_SP5','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EQ_FWD_SP5','Example_15');
INSERT PortfolioEquityForwardData (LongShort,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Short','2018-02-05','SP5','USD',2147.56,775,'15EQ_FWD_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','15EQ_CALL_LUFT','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EQ_CALL_LUFT','Example_15');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('Lufthansa','EUR',12.24,775,'15EQ_CALL_LUFT','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-03-01','15EQ_CALL_LUFT');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','15EQ_PUT_LUFT','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EQ_PUT_LUFT','Example_15');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('Lufthansa','EUR',12.24,775,'15EQ_PUT_LUFT','Long','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-03-01','15EQ_PUT_LUFT');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityForward','15EQ_FWD_LUFT','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15EQ_FWD_LUFT','Example_15');
INSERT PortfolioEquityForwardData (LongShort,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Long','2018-03-01','Lufthansa','EUR',12.24,775,'15EQ_FWD_LUFT');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','15CPI_Swap','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15CPI_Swap','Example_15');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears) VALUES ('Floating','true','GBP','ACT/ACT','ModifiedFollowing',15017,'15CPI_Swap','GBP-LIBOR-6M','false');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15017,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,15017,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-07-18','2021-07-18','6M','UK','ModifiedFollowing','ModifiedFollowing','Forward',15017,15016);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,CPILegIndexName,CPILegBaseCPI,CPILegObservationLag,CPILegInterpolated) VALUES ('CPI','false','GBP','ACT/ACT','Following',15018,'15CPI_Swap','UKRPI',210,'2M','false');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15018,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,15018,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-07-18','2021-07-18','1Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',15018,15017);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','15YearOnYear_Swap','CPTY_A','15CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15YearOnYear_Swap','Example_15');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears) VALUES ('Floating','true','EUR','ACT/360','ModifiedFollowing',15019,'15YearOnYear_Swap','EUR-EURIBOR-6M','false');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15019,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,15019,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-07-18','2021-07-18','6M','TARGET','ModifiedFollowing','ModifiedFollowing','Forward',15019,15018);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,YYLegIndexName,YYLegFixingDays,YYLegObservationLag,YYLegInterpolated) VALUES ('YY','false','EUR','ACT/ACT','Following',15020,'15YearOnYear_Swap','EUHICPXT',2,'2M','true');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',15020,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-07-18','2021-07-18','1Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',15020,15019);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CreditDefaultSwap','15CDS','CPTY_B','15CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('15CDS','Example_15');
INSERT PortfolioCreditDefaultSwapData (IssuerId,CreditCurveId,SettlesAccrual,PaysAtDefaultTime,ProtectionStart,UpfrontDate,UpfrontFee,TradeId) VALUES ('CPTY_C','BANK','Y','Y','20160206','20160208',0.0,'15CDS');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','true','USD','A360','F',15021,'15CDS');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,15021,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.01,15021,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','3M','US','F','F','CDS2015',15021,15020);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','16EqCall_SP5','CPTY_A','16CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('16EqCall_SP5','Example_16');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('SP5','USD',2147.56,775,'16EqCall_SP5','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-02-05','16EqCall_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','16EqPut_SP5','CPTY_A','16CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('16EqPut_SP5','Example_16');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('SP5','USD',2147.56,775,'16EqPut_SP5','Short','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-02-05','16EqPut_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityForward','16EqFwd_SP5','CPTY_A','16CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('16EqFwd_SP5','Example_16');
INSERT PortfolioEquityForwardData (LongShort,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Short','2018-02-05','SP5','USD',2147.56,775,'16EqFwd_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','16EqCall_Luft','CPTY_A','16CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('16EqCall_Luft','Example_16');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('Lufthansa','EUR',12.24,775,'16EqCall_Luft','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-03-01','16EqCall_Luft');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','16EqPut_Luft','CPTY_A','16CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('16EqPut_Luft','Example_16');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('Lufthansa','EUR',12.24,775,'16EqPut_Luft','Long','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-03-01','16EqPut_Luft');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityForward','16EqForwardTrade_Luft','CPTY_A','16CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('16EqForwardTrade_Luft','Example_16');
INSERT PortfolioEquityForwardData (LongShort,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Long','2018-03-01','Lufthansa','EUR',12.24,775,'16EqForwardTrade_Luft');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','17CPI_Swap_1','CPTY_A','17CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('17CPI_Swap_1','Example_17');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Cashflow','true','GBP','ACT/ACT','Unadjusted',17001,'17CPI_Swap_1');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalFinalExchange,CPILegIndexName,CPILegBaseCPI,CPILegObservationLag,CPILegInterpolated) VALUES ('CPI','false','GBP','ACT/ACT','Following',17002,'17CPI_Swap_1','true','UKRPI',210,'2M','false');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',17002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (1,17002,0);
INSERT PortfolioScheduleDataRules (LegDataId,Id) VALUES (17002,17000);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','17CPI_Swap_2','CPTY_A','17CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('17CPI_Swap_2','Example_17');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears) VALUES ('Floating','true','GBP','ACT/ACT','ModifiedFollowing',17003,'17CPI_Swap_2','GBP-LIBOR-6M','false');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',17003,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0,17003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-07-18','2021-07-18','6M','UK','ModifiedFollowing','ModifiedFollowing','Forward',17003,17001);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,CPILegIndexName,CPILegBaseCPI,CPILegObservationLag,CPILegInterpolated) VALUES ('CPI','false','GBP','ACT/ACT','Following',17004,'17CPI_Swap_2','UKRPI',210,'2M','false');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',17004,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,17004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-07-18','2021-07-18','1Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',17004,17002);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','17YearOnYear_Swap','CPTY_A','17CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('17YearOnYear_Swap','Example_17');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','true','EUR','30/360','F',17005,'17YearOnYear_Swap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,17005,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.008375,17005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-02-05','2021-02-05','1Y','TARGET','F','F','Forward',17005,17003);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,YYLegIndexName,YYLegFixingDays,YYLegObservationLag,YYLegInterpolated) VALUES ('YY','false','EUR','ACT/ACT','Following',17006,'17YearOnYear_Swap','EUHICPXT',2,'2M','true');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',17006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('2016-02-05','2021-02-05','1Y','UK','ModifiedFollowing','ModifiedFollowing','Forward',17006,17004);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Fixed','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Fixed','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Fixed');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18001,'18Bond_Fixed');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',18001,18000);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Floating','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Floating','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Floating');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','EUR','ACT/ACT','F',18002,'18Bond_Floating','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.01,18002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','6M','TARGET','F','F','Forward',18002,18001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Fixed_Then_Floating','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Fixed_Then_Floating','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Fixed_Then_Floating');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18003,'18Bond_Fixed_Then_Floating');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18003,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',18003,18002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','EUR','ACT/ACT','F',18004,'18Bond_Fixed_Then_Floating','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18004,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.01,18004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20210203','20260203','6M','TARGET','F','F','Forward',18004,18003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Amortizing_FixedAmount','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Amortizing_FixedAmount','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Amortizing_FixedAmount');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18005,'18Bond_Amortizing_FixedAmount');
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Frequency,Underflow,LegDataId,SeqId) VALUES ('FixedAmount',1000000,'20170203','1Y','false',18005,0);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18005,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18005,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',18005,18004);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Amortizing_Percentage_Initial','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Amortizing_Percentage_Initial','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Amortizing_Percentage_Initial');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18006,'18Bond_Amortizing_Percentage_Initial');
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Frequency,Underflow,LegDataId,SeqId) VALUES ('RelativeToInitialNotional',0.05,'20170203','1Y','false',18006,0);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18006,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18006,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',18006,18005);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Amortizing_Percentage_Previous','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Amortizing_Percentage_Previous','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Amortizing_Percentage_Previous');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18007,'18Bond_Amortizing_Percentage_Previous');
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Frequency,Underflow,LegDataId,SeqId) VALUES ('RelativeToPreviousNotional',0.05,'20170203','1Y','false',18007,0);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18007,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18007,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',18007,18006);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Amortizing_Fixed_Annuity','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Amortizing_Fixed_Annuity','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Amortizing_Fixed_Annuity');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18008,'18Bond_Amortizing_Fixed_Annuity');
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Underflow,LegDataId,SeqId) VALUES ('Annuity',1000000,'20170203','false',18008,0);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18008,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18008,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','1Y','TARGET','F','F','Forward',18008,18007);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Amortizing_Floating_Annuity','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Amortizing_Floating_Annuity','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Amortizing_Floating_Annuity');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','EUR','ACT/ACT','F',18009,'18Bond_Amortizing_Floating_Annuity','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Underflow,LegDataId,SeqId) VALUES ('Annuity',1000000,'20170203','false',18009,0);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18009,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.01,18009,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20210203','6M','TARGET','F','F','Forward',18009,18008);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty) VALUES ('Bond','18Bond_Amortizing_FixedAmount_PercentagePrevious','CPTY_C');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('18Bond_Amortizing_FixedAmount_PercentagePrevious','Example_18');
INSERT PortfolioBondData (IssuerId,CreditCurveId,SecurityId,ReferenceCurveId,SettlementDays,Calendar,IssueDate,TradeId) VALUES ('CPTY_C','CPTY_C','SECURITY_1','EUR-EURIBOR-6M',2,'TARGET','20160203','18Bond_Amortizing_FixedAmount_PercentagePrevious');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','ACT/ACT','F',18010,'18Bond_Amortizing_FixedAmount_PercentagePrevious');
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Frequency,Underflow,LegDataId,SeqId) VALUES ('FixedAmount',1000000,'20170203','1Y','false',18010,0);
INSERT PortfolioLegAmortizations (Type,Value,StartDate,Frequency,Underflow,LegDataId,SeqId) VALUES ('RelativeToPreviousNotional',0.01,'20210203','1Y','false',18010,1);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,18010,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.05,18010,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160203','20260203','1Y','TARGET','F','F','Forward',18010,18009);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CreditDefaultSwap','20CDS','CPTY_B','20CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('20CDS','Example_20');
INSERT PortfolioCreditDefaultSwapData (IssuerId,CreditCurveId,SettlesAccrual,PaysAtDefaultTime,ProtectionStart,UpfrontDate,UpfrontFee,TradeId) VALUES ('CPTY_A','BANK','Y','Y','20160206','20160208',0.0,'20CDS');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','true','USD','A360','F',20001,'20CDS');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,20001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.01,20001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','3M','US','F','F','CDS2015',20001,20000);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','22EQ_CALL_SP5','CPTY_A','22CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('22EQ_CALL_SP5','Example_22');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('SP5','USD',2147.56,775,'22EQ_CALL_SP5','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-02-05','22EQ_CALL_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','22EQ_PUT_SP5','CPTY_A','22CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('22EQ_PUT_SP5','Example_22');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('SP5','USD',2147.56,775,'22EQ_PUT_SP5','Short','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-02-05','22EQ_PUT_SP5');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swaption','22Swaption_CALL','CPTY_A','22CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('22Swaption_CALL','Example_22');
INSERT PortfolioSwaptionData (TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('22Swaption_CALL','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('20170301','22Swaption_CALL');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',22001,'22Swaption_CALL');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,22001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.01,22001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20170301','20360301','1Y','TARGET','F','F','Forward',22001,22000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',22002,'22Swaption_CALL','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,22002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,22002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20170301','20360301','6M','TARGET','MF','MF','Forward',22002,22001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxOption','22FX_CALL_OPTION','CPTY_A','22CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('22FX_CALL_OPTION','Example_22');
INSERT PortfolioFxOptionData (BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('EUR',1000000,'USD',1100000,'22FX_CALL_OPTION','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2026-03-01','22FX_CALL_OPTION');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('ForwardRateAgreement','23fra1','CPTY_A','23CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('23fra1','Example_23');
INSERT PortfolioForwardRateAgreementData (StartDate,EndDate,Currency,IndexName,LongShort,Strike,Notional,TradeId) VALUES ('2016-10-28','2035-10-28','EUR','EUR-EURIBOR-6M','Long',0.00001,100000000,'23fra1');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','23averageOIS','CPTY_A','23CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('23averageOIS','Example_23');
INSERT PortfolioLegData (Payer,Currency,DayCounter,PaymentConvention,LegType,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('false','USD','A360','MF','Floating',23001,'23averageOIS','USD-FedFunds','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,23001,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000188,23001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,EndOfMonth,LegDataId,Id) VALUES ('20160209','20210209','3M','US','MF','MF','Backward','false',23001,23000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','true','USD','30/360','MF',23002,'23averageOIS');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,23002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.012404,23002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,EndOfMonth,LegDataId,Id) VALUES ('20160209','20210209','6M','US','MF','MF','Backward','false',23002,23001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','23averageOIS1','CPTY_A','23CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('23averageOIS1','Example_23');
INSERT PortfolioLegData (Payer,Currency,DayCounter,PaymentConvention,LegType,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('false','USD','A360','MF','Floating',23003,'23averageOIS1','USD-FedFunds','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,23003,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000188,23003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,EndOfMonth,LegDataId,Id) VALUES ('20160209','20210209','3M','US','MF','MF','Backward','false',23003,23002);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','23averageOIS2','CPTY_A','23CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('23averageOIS2','Example_23');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','true','USD','30/360','MF',23004,'23averageOIS2');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,23004,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.012404,23004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,EndOfMonth,LegDataId,Id) VALUES ('20160209','20210209','6M','US','MF','MF','Backward','false',23004,23003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','24Swap_20','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24Swap_20','Example_24');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Fixed','false','EUR','30/360','F',24001,'24Swap_20');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,24001,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.02,24001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160210','20260210','1Y','TARGET','F','F','Forward',24001,24000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',24002,'24Swap_20','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,24002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,24002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160210','20260210','6M','TARGET','MF','MF','Forward',24002,24001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityForward','24EquityForward_LUFT','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24EquityForward_LUFT','Example_24');
INSERT PortfolioEquityForwardData (LongShort,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Long','2018-03-01','Lufthansa','EUR',12.24,775,'24EquityForward_LUFT');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquityOption','24EquityOption_LUFT','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24EquityOption_LUFT','Example_24');
INSERT PortfolioEquityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('Lufthansa','EUR',12.24,775,'24EquityOption_LUFT','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2018-03-01','24EquityOption_LUFT');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CommodityForward','24CommodityForward_Gold_1Y','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24CommodityForward_Gold_1Y','Example_24');
INSERT PortfolioCommodityForwardData (Position,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Short','2017-02-05','COMDTY_GOLD_USD','USD',1162.0,1000,'24CommodityForward_Gold_1Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CommodityForward','24CommodityForward_Gold_Apr_17','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24CommodityForward_Gold_Apr_17','Example_24');
INSERT PortfolioCommodityForwardData (Position,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Long','2017-04-28','COMDTY_GOLD_USD','USD',1161.8,500,'24CommodityForward_Gold_Apr_17');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CommodityForward','24CommodityForward_WTI_2Y','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24CommodityForward_WTI_2Y','Example_24');
INSERT PortfolioCommodityForwardData (Position,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Long','2018-02-05','COMDTY_WTI_USD','USD',46.0,1000000,'24CommodityForward_WTI_2Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CommodityForward','24CommodityForward_WTI_Oct_21','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24CommodityForward_WTI_Oct_21','Example_24');
INSERT PortfolioCommodityForwardData (Position,Maturity,Name,Currency,Strike,Quantity,TradeId) VALUES ('Short','2021-10-31','COMDTY_WTI_USD','USD',49.75,500000,'24CommodityForward_WTI_Oct_21');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CommodityOption','24CommodityOption_WTI_Oct_21','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24CommodityOption_WTI_Oct_21','Example_24');
INSERT PortfolioCommodityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('COMDTY_WTI_USD','USD',49.75,500000,'24CommodityOption_WTI_Oct_21','Long','Call','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2021-10-31','24CommodityOption_WTI_Oct_21');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CommodityOption','24CommodityOption_Gold_Apr_17','CPTY_A','24CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('24CommodityOption_Gold_Apr_17','Example_24');
INSERT PortfolioCommodityOptionData (Name,Currency,Strike,Quantity,TradeId,OptionDataLongShort,OptionDataOptionType,OptionDataStyle,OptionDataSettlement,OptionDataPayOffAtExpiry) VALUES ('COMDTY_GOLD_USD','USD',1161.8,500,'24CommodityOption_Gold_Apr_17','Short','Put','European','Cash','false');
INSERT PortfolioOptionExercises (ExerciseDate,TradeId) VALUES ('2017-04-28','24CommodityOption_Gold_Apr_17');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CPICapFloor','25CPI_EUHICPXT_Cap','CPTY_B','25CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('25CPI_EUHICPXT_Cap','Example_25');
INSERT PortfolioCPICapFloorData (LongShort,CapFloor,Currency,Notional,StartDate,MaturityDate,IndexName,ObservationLag,BaseCPI,Strike,FixCalendar,PayCalendar,FixConvention,PayConvention,TradeId) VALUES ('Long','Cap','EUR',10000,'2016-02-05','2026-02-05','EUHICPXT','3M',100.17,0.011275,'TARGET','TARGET','F','F','25CPI_EUHICPXT_Cap');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CPICapFloor','25CPI_EUHICPXT_Floor','CPTY_B','25CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('25CPI_EUHICPXT_Floor','Example_25');
INSERT PortfolioCPICapFloorData (LongShort,CapFloor,Currency,Notional,StartDate,MaturityDate,IndexName,ObservationLag,BaseCPI,Strike,FixCalendar,PayCalendar,FixConvention,PayConvention,TradeId) VALUES ('Long','Floor','EUR',10000,'2016-02-05','2026-02-05','EUHICPXT','3M',100.17,0.011275,'TARGET','TARGET','F','F','25CPI_EUHICPXT_Floor');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CPICapFloor','25CPI_UKRPI_Cap','CPTY_B','25CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('25CPI_UKRPI_Cap','Example_25');
INSERT PortfolioCPICapFloorData (LongShort,CapFloor,Currency,Notional,StartDate,MaturityDate,IndexName,ObservationLag,BaseCPI,Strike,FixCalendar,PayCalendar,FixConvention,PayConvention,TradeId) VALUES ('Long','Cap','GBP',10000,'2016-02-05','2026-02-05','UKRPI','2M',260.6,0.030445,'UK','UK','MF','U','25CPI_UKRPI_Cap');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('CPICapFloor','25CPI_UKRPI_Floor','CPTY_B','25CPTY_B');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('25CPI_UKRPI_Floor','Example_25');
INSERT PortfolioCPICapFloorData (LongShort,CapFloor,Currency,Notional,StartDate,MaturityDate,IndexName,ObservationLag,BaseCPI,Strike,FixCalendar,PayCalendar,FixConvention,PayConvention,TradeId) VALUES ('Long','Floor','GBP',10000,'2016-02-05','2026-02-05','UKRPI','2M',260.6,0.030445,'UK','UK','MF','U','25CPI_UKRPI_Floor');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','27Digital_CMS_Spread','CPTY_A','27CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('27Digital_CMS_Spread','Example_27');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('DigitalCMSSpread','false','EUR','30/360','F',27001,'27Digital_CMS_Spread');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,27001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20180424','20200424','3M','TARGET','MF','MF','Forward',27001,27000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',27002,'27Digital_CMS_Spread','EUR-EURIBOR-6M','true',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,27002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0080,27002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20180424','20200424','3M','TARGET','MF','MF','Forward',27002,27001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','28CMS_Spread_Swap','CPTY_A','28CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('28CMS_Spread_Swap','Example_28');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('CMSSpread','false','EUR','30/360','F',28001,'28CMS_Spread_Swap');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,28001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20161028','20351028','1Y','TARGET','F','F','Forward',28001,28000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','EUR','A360','MF',28002,'28CMS_Spread_Swap','EUR-EURIBOR-6M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (10000000.000000,28002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.0080,28002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20161028','20351028','6M','TARGET','MF','MF','Forward',28002,28001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquitySwap','30EquitySwap_1','CPTY_A','30CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('30EquitySwap_1','Example_30');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Equity','true','USD','A360','F',30001,'30EquitySwap_1');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,30001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','3M','USD','F','F','Forward',30001,30000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','USD','A360','MF',30002,'30EquitySwap_1','false','false','USD-LIBOR-3M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,30002,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,30002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','3M','USD','MF','MF','Forward',30002,30001);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('EquitySwap','30EquitySwap_2','CPTY_A','30CPTY_A');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('30EquitySwap_2','Example_30');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId) VALUES ('Equity','true','USD','A360','F',30003,'30EquitySwap_2');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,30003,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','3M','USD','F','F','Forward',30003,30002);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','false','USD','A360','MF',30004,'30EquitySwap_2','false','false','USD-LIBOR-3M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES (100000000,30004,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,30004,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160205','20260205','3M','USD','MF','MF','Forward',30004,30003);

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxForward','31FXFWD_1Y','CP','31NS');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('31FXFWD_1Y','Example_31');
INSERT PortfolioFxForwardData (ValueDate,BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId) VALUES ('2017-02-06','EUR','11000000','GBP',9009771.17020212,'31FXFWD_1Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('FxForward','31FXFWD_5Y','CP','31NS');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('31FXFWD_5Y','Example_31');
INSERT PortfolioFxForwardData (ValueDate,BoughtCurrency,BoughtAmount,SoldCurrency,SoldAmount,TradeId) VALUES ('2021-02-05','EUR','11000000','GBP',9512182.29875867,'31FXFWD_5Y');

INSERT PortfolioTrades (TradeType,id,EnvelopeCounterParty,EnvelopeNettingSetId) VALUES ('Swap','32SWAP_TRY_FIXED_USD_FLOAT','CP','32NS');
INSERT PortfolioTradeGroupingIds (TradeId,GroupingId) VALUES ('32SWAP_TRY_FIXED_USD_FLOAT','Example_32');
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange,FloatingLegIndexName,FloatingLegIsInArrears,FloatingLegFixingDays) VALUES ('Floating','true','USD','A360','MF',32001,'32SWAP_TRY_FIXED_USD_FLOAT','true','true','USD-LIBOR-3M','false',2);
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('10000000',32001,0);
INSERT PortfolioFloatingLegSpreads (Spread,LegDataId,SeqId) VALUES (0.000000,32001,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20210209','3M','US,UK,TRY','F','F','Backward',32001,32000);
INSERT PortfolioLegData (LegType,Payer,Currency,DayCounter,PaymentConvention,Id,TradeId,NotionalInitialExchange,NotionalFinalExchange) VALUES ('Fixed','false','TRY','A360','F',32002,'32SWAP_TRY_FIXED_USD_FLOAT','true','true');
INSERT PortfolioLegNotionals (Notional,LegDataId,SeqId) VALUES ('29232500',32002,0);
INSERT PortfolioFixedLegCPIRates (Rate,LegDataId,SeqId) VALUES (0.1047,32002,0);
INSERT PortfolioScheduleDataRules (StartDate,EndDate,Tenor,Calendar,Convention,TermConvention,RuleName,LegDataId,Id) VALUES ('20160209','20210209','1Y','US,UK,TRY','F','F','Backward',32002,32001);

