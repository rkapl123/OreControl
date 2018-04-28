echo starting ORE DB Creation scripts > MSSQL.log
call runSingleScriptMSSQL.cmd oreDBCreateMSSQL.sql
call runSingleScriptMSSQL.cmd Tables\TypesTables.sql
call runSingleScriptMSSQL.cmd Tables\MdatTables.sql
call runSingleScriptMSSQL.cmd Tables\PricingengineTables.sql
call runSingleScriptMSSQL.cmd Tables\ConventionsTables.sql
call runSingleScriptMSSQL.cmd Tables\TodaysmarketTables.sql
call runSingleScriptMSSQL.cmd Tables\TodaysmarketTableTriggerMSSQL.sql
call runSingleScriptMSSQL.cmd Tables\CurveConfigurationTables.sql
call runSingleScriptMSSQL.cmd Tables\OreParametersTables.sql
call runSingleScriptMSSQL.cmd Tables\NettingTables.sql
call runSingleScriptMSSQL.cmd Tables\SimulationTables.sql
call runSingleScriptMSSQL.cmd Tables\PortfolioTables.sql
call runSingleScriptMSSQL.cmd Tables\StresstestTables.sql
call runSingleScriptMSSQL.cmd Tables\SensitivityanalysisTables.sql
call runSingleScriptMSSQL.cmd Tables\ResultsTables.sql

call runSingleScriptMSSQL.cmd XMLselectionViews\conventions.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\curveconfig.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\netting.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\ore.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\portfolio.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\pricingengine.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\sensitivity.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\simulation.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\stresstest.sql
call runSingleScriptMSSQL.cmd XMLselectionViews\todaysmarket.sql

call runSingleScriptMSSQL.cmd Data\ore_types.sql
call runSingleScriptMSSQL.cmd Data\ore_typesOther.sql
call runSingleScriptMSSQL.cmd Data\marketdata.sql
call runSingleScriptMSSQL.cmd Data\pricingengine.sql 
call runSingleScriptMSSQL.cmd Data\conventions.sql
call runSingleScriptMSSQL.cmd Data\todaysmarket.sql
call runSingleScriptMSSQL.cmd Data\curveconfig.sql
call runSingleScriptMSSQL.cmd Data\ore_typesOther2.sql
call runSingleScriptMSSQL.cmd Data\ore.sql
call runSingleScriptMSSQL.cmd Data\netting.sql
call runSingleScriptMSSQL.cmd Data\simulation.sql
call runSingleScriptMSSQL.cmd Data\portfolio.sql
call runSingleScriptMSSQL.cmd Data\stresstest.sql
call runSingleScriptMSSQL.cmd Data\sensitivity.sql
call runSingleScriptMSSQL.cmd Data\covariancedata.sql
call runSingleScriptMSSQL.cmd Data\fixingdata.sql

pause