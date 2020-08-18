sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from CurveConfigSelection" -y0 -o curveconfig.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from ConventionsSelection" -y0 -o conventions.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from PricingEngineSelection" -y0 -o pricingengine.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from TodaysmarketSelection" -y0 -o todaysmarket.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select OreConfigId ,':',XMLdata from OreParametersSelection" -y0 -o ore.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from NettingSetSelection" -y0 -o netting.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from PortfolioSelection" -y0 -o portfolio.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select Id,':',XMLdata from SimulationSelection" -y0 -o simulation.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select Id,':',XMLdata from SensitivityanalysisSelection" -y0 -o sensitivity.xml
sqlcmd -S LENOVO-PC -d ORE -E -Q "set nocount on;select GroupingId,':',XMLdata from StresstestSelection" -y0 -o stresstest.xml
sqlcmd -S LENOVO-PC -r1 -E -i alterExistingTables.sql 2>> migration.log
sqlcmd -S LENOVO-PC -r1 -E -i dropConfigTables.sql 2>> migration.log
sqlcmd -S LENOVO-PC -r1 -E -i alterPortfolioSelection.sql 2>> migration.log
