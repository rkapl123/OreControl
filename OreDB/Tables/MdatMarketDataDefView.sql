USE [ORE]
GO
CREATE VIEW [dbo].[MdatMarketDataDef]
AS
select m.QuoteDate, m.QuoteId, d.Quote, m.QuoteValue
FROM ORE.dbo.MdatMarketData m 
INNER JOIN ORE.dbo.MdatMarketDataDefinitions d on m.QuoteID = d.QuoteID


GO
