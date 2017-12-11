use ORE
GO

CREATE VIEW OreParametersSelection
AS
SELECT DISTINCT o.OreConfigId, 
	(SELECT
		(SELECT [name] [@name], Parameter [data()] 
		FROM OreParametersSetup WHERE OreConfigId = o.OreConfigId
		FOR XML PATH ('Parameter'), TYPE) Setup,
		(SELECT [name] [@name], Parameter [data()] 
		FROM OreParametersMarkets WHERE OreConfigId = o.OreConfigId
		FOR XML PATH ('Parameter'), TYPE) Markets,
		(SELECT 
			type [@type],
			(SELECT p.name [@name], p.Parameter [data()] 
			FROM OreParametersAnalytics p WHERE p.type = po.type AND p.OreConfigId = o.OreConfigId
			FOR XML PATH ('Parameter'), TYPE)
		FROM (SELECT DISTINCT type FROM OreParametersAnalytics WHERE OreConfigId = o.OreConfigId) po 
		FOR XML PATH ('Analytic'), TYPE) Analytics
	FOR XML PATH('ORE')) XMLData
FROM OreParametersSetup o