use ORE
GO

CREATE VIEW PricingEngineSelection
AS
SELECT DISTINCT pep.GroupingId,
(SELECT
	(SELECT P.Type [@type], P.Model [Model],
		ISNULL((SELECT
			[name] [@name],
			Parameter [data()]
		FROM PricingEngineModelParameters WHERE Type = P.Type 
		FOR XML PATH('Parameter'), TYPE),(SELECT '' FOR XML PATH (''), TYPE)) ModelParameters,
		P.Engine [Engine],
		ISNULL((SELECT 
			[name] [@name],
			Parameter [data()] 
		FROM PricingEngineEngineParameters WHERE Type = P.Type 
	FOR XML PATH('Parameter'), TYPE),(SELECT '' FOR XML PATH (''), TYPE)) EngineParameters
	FROM PricingEngineProducts P WHERE P.GroupingId = pep.GroupingId
	FOR XML PATH ('Product'), ROOT('PricingEngines'))) XMLData
FROM PricingEngineProducts pep
