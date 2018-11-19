echo starting ORE DB Creation scripts > MSSQL.log
set runscript=%1
if "%runscript%" == "" (
	set runscript=runSingleScriptMSSQL.cmd
)
set dbcreatescript=%2
if "%dbcreatescript%" == "" (
	set dbcreatescript=oreDBCreateMSSQL.sql
)
call %runscript% %dbcreatescript%
call %runscript% Tables\TypesTables.sql
call %runscript% Tables\MdatTables.sql
call %runscript% Tables\PricingengineTables.sql
call %runscript% Tables\ConventionsTables.sql
call %runscript% Tables\TodaysmarketTables.sql
call %runscript% Tables\TodaysmarketTableTriggerMSSQL.sql
call %runscript% Tables\CurveConfigurationTables.sql
call %runscript% Tables\OreParametersTables.sql
call %runscript% Tables\NettingTables.sql
call %runscript% Tables\SimulationTables.sql
call %runscript% Tables\PortfolioTables.sql
call %runscript% Tables\StresstestTables.sql
call %runscript% Tables\SensitivityanalysisTables.sql
call %runscript% Tables\ResultsTables.sql

call %runscript% XMLselectionViews\conventions.sql
call %runscript% XMLselectionViews\curveconfig.sql
call %runscript% XMLselectionViews\netting.sql
call %runscript% XMLselectionViews\ore.sql
call %runscript% XMLselectionViews\portfolio.sql
call %runscript% XMLselectionViews\pricingengine.sql
call %runscript% XMLselectionViews\sensitivity.sql
call %runscript% XMLselectionViews\simulation.sql
call %runscript% XMLselectionViews\stresstest.sql
call %runscript% XMLselectionViews\todaysmarket.sql

call %runscript% Data\ore_types.sql
call %runscript% Data\ore_typesOther.sql
call %runscript% Data\marketdata.sql
call %runscript% Data\pricingengine.sql 
call %runscript% Data\conventions.sql
call %runscript% Data\todaysmarket.sql
call %runscript% Data\curveconfig.sql
call %runscript% Data\ore_typesOther2.sql
call %runscript% Data\ore.sql
call %runscript% Data\netting.sql
call %runscript% Data\simulation.sql
call %runscript% Data\portfolio.sql
call %runscript% Data\stresstest.sql
call %runscript% Data\sensitivity.sql
call %runscript% Data\covariancedata.sql
call %runscript% Data\fixingdata.sql

pause