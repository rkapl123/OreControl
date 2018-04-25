echo starting ORE DB Creation scripts > MYSQL.log
call runSingleScriptMYSQL.cmd oreDBCreateMYSQL.sql
call runSingleScriptMYSQL.cmd Tables\TypesTables.sql
call runSingleScriptMYSQL.cmd Tables\PricingengineTables.sql
call runSingleScriptMYSQL.cmd Tables\ConventionsTables.sql
call runSingleScriptMYSQL.cmd Tables\TodaysmarketTables.sql
call runSingleScriptMYSQL.cmd Tables\CurveConfigurationTables.sql
call runSingleScriptMYSQL.cmd Tables\OreParametersTables.sql
call runSingleScriptMYSQL.cmd Tables\NettingTables.sql
call runSingleScriptMYSQL.cmd Tables\SimulationTables.sql
call runSingleScriptMYSQL.cmd Tables\PortfolioTables.sql
call runSingleScriptMYSQL.cmd Tables\StresstestTables.sql
call runSingleScriptMYSQL.cmd Tables\SensitivityanalysisTables.sql
call runSingleScriptMYSQL.cmd Tables\MarketdataTables.sql
call runSingleScriptMYSQL.cmd Tables\ResultsTables.sql

call runSingleScriptMYSQL.cmd Data\ore_types.sql
call runSingleScriptMYSQL.cmd Data\ore_typesOther.sql
call runSingleScriptMYSQL.cmd Data\pricingengine.sql 
call runSingleScriptMYSQL.cmd Data\conventions.sql
call runSingleScriptMYSQL.cmd Data\todaysmarket.sql
call runSingleScriptMYSQL.cmd Data\curveconfig.sql
call runSingleScriptMYSQL.cmd Data\ore_typesOther2.sql
call runSingleScriptMYSQL.cmd Data\ore.sql
call runSingleScriptMYSQL.cmd Data\netting.sql
call runSingleScriptMYSQL.cmd Data\simulation.sql
call runSingleScriptMYSQL.cmd Data\portfolio.sql
call runSingleScriptMYSQL.cmd Data\stresstest.sql
call runSingleScriptMYSQL.cmd Data\sensitivity.sql
call runSingleScriptMYSQL.cmd Data\marketdata.sql
call runSingleScriptMYSQL.cmd Data\covariancedata.sql
call runSingleScriptMYSQL.cmd Data\fixingdata.sql

pause