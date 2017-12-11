rem update paths in example 1 ore parameters to have everything in one folder
sqlcmd -S LENOVO-PC -d ORE -E -i updateexampleore.sql
rem generate xml files from Database
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from CurveConfigSelection where GroupingId = 'ExampleInput'" -y0 -o OREDB\curveconfig.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from ConventionsSelection where GroupingId = 'ExampleInput'" -y0 -o OREDB\conventions.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from PricingEngineSelection where GroupingId = 'ExampleInput'" -y0 -o OREDB\pricingengine.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from TodaysmarketSelection where GroupingId = 'ExampleInput'" -y0 -o OREDB\todaysmarket.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from OreParametersSelection where OreConfigId = 'Example_2'" -y0 -o OREDB\ore.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from NettingSetSelection where GroupingId = 'Example_2'" -y0 -o OREDB\netting.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from PortfolioSelection where GroupingId = 'Example_2'" -y0 -o OREDB\portfolio.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from SimulationSelection where Id = 'Example_2'" -y0 -o OREDB\simulation.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select XMLdata from SensitivityanalysisSelection where Id = 'Example_15'" -y0 -o OREDB\sensitivity.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;SELECT f.FixingDate,fd.FixingIndex,f.IndexValue FROM FixingData f INNER JOIN FixingDataDefinitions fd ON f.IndexId = fd.IndexId ORDER BY f.FixingDate" -y0 -o OREDB\fixingdata.txt
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;SELECT m.QuoteDate,md.Quote,m.QuoteValue FROM MarketData m INNER JOIN MarketDataDefinitions md ON m.QuoteId = md.QuoteId" -y0 -o OREDB\marketdata.txt
rem start ORE with generated xml
C:\dev\ORE-1.8.2\App\bin\x64\Release\ore.exe OREDB\ore.xml
pause