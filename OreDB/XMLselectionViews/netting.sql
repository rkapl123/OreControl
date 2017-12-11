use ORE
GO

CREATE VIEW NettingSetSelection
AS
SELECT DISTINCT ns.GroupingId,
	(SELECT
		(SELECT *, 
			(SELECT Bilateral,CSACurrency,IndexName,ThresholdPay,ThresholdReceive,MinimumTransferAmountPay,MinimumTransferAmountReceive,
				(SELECT IndependentAmountHeld,IndependentAmountType
				FROM NettingCSADetails c WHERE c.NettingSetId = n.NettingSetId
				FOR XML PATH (''), TYPE) IndependentAmount,
				(SELECT CallFrequency,PostFrequency
				FROM NettingCSADetails c WHERE c.NettingSetId = n.NettingSetId
				FOR XML PATH (''), TYPE) MarginingFrequency,
				MarginPeriodOfRisk,CollateralCompoundingSpreadReceive,CollateralCompoundingSpreadPay,
				(SELECT '',
					(SELECT Currency
					FROM NettingEligibleCollateralsCurrencies e WHERE e.NettingSetId = n.NettingSetId
					FOR XML PATH (''), TYPE) Currencies
				FOR XML PATH (''), TYPE) EligibleCollaterals
			FROM NettingCSADetails c WHERE c.NettingSetId = n.NettingSetId
			FOR XML PATH (''), TYPE) CSADetails
		FROM NettingSet n WHERE n.GroupingId = ns.GroupingId
		FOR XML PATH ('NettingSet'), TYPE)
	FOR XML PATH ('NettingSetDefinitions')) XMLData
FROM NettingSet ns
