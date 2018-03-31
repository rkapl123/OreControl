use ORE

INSERT NettingSet (Counterparty,ActiveCSAFlag,NettingSetId,GroupingId) VALUES ('CPTY_A','false','CPTY_A','NettingSetGroupingId')
INSERT NettingCSADetails (Bilateral,CSACurrency,IndexName,ThresholdPay,ThresholdReceive,MinimumTransferAmountPay,MinimumTransferAmountReceive,MarginPeriodOfRisk,CollateralCompoundingSpreadReceive,CollateralCompoundingSpreadPay,NettingSetId,IndependentAmountHeld,IndependentAmountType,CallFrequency,PostFrequency) VALUES ('Bilateral','EUR','EUR-EONIA',100000,100000,0,0,'0W',0.00,0.00,'CPTY_A',0,'FIXED','1D','1D')
INSERT NettingEligibleCollateralsCurrencies (Currency,NettingSetId) VALUES ('EUR','CPTY_A')
INSERT NettingSet (Counterparty,ActiveCSAFlag,NettingSetId,GroupingId) VALUES ('CPTY_B','true','CPTY_B','NettingSetGroupingId')
INSERT NettingCSADetails (Bilateral,CSACurrency,IndexName,ThresholdPay,ThresholdReceive,MinimumTransferAmountPay,MinimumTransferAmountReceive,MarginPeriodOfRisk,CollateralCompoundingSpreadReceive,CollateralCompoundingSpreadPay,NettingSetId,IndependentAmountHeld,IndependentAmountType,CallFrequency,PostFrequency) VALUES ('Bilateral','EUR','EUR-EONIA',0,0,5000000,5000000,'2W',0.00,0.00,'CPTY_B',0,'FIXED','1D','1D')
INSERT NettingEligibleCollateralsCurrencies (Currency,NettingSetId) VALUES ('EUR','CPTY_B')
