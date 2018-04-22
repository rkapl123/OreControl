echo starting ORE DB Creation scripts > sql.log
call runSingleScript.cmd oreDBCreate.sql
call runSingleScript.cmd Tables\TypesTables.sql
call runSingleScript.cmd Tables\PricingengineTables.sql
call runSingleScript.cmd Tables\ConventionsTables.sql
call runSingleScript.cmd Tables\TodaysmarketTables.sql
call runSingleScript.cmd Tables\CurveConfigurationTables.sql
call runSingleScript.cmd Tables\OreParametersTables.sql
call runSingleScript.cmd Tables\NettingTables.sql
call runSingleScript.cmd Tables\SimulationTables.sql
call runSingleScript.cmd Tables\PortfolioTables.sql
call runSingleScript.cmd Tables\StresstestTables.sql
call runSingleScript.cmd Tables\SensitivityanalysisTables.sql
call runSingleScript.cmd Tables\MarketdataTables.sql
call runSingleScript.cmd Tables\ResultsTables.sql

call runSingleScript.cmd XMLselectionViews\conventions.sql
call runSingleScript.cmd XMLselectionViews\curveconfig.sql
call runSingleScript.cmd XMLselectionViews\netting.sql
call runSingleScript.cmd XMLselectionViews\ore.sql
call runSingleScript.cmd XMLselectionViews\portfolio.sql
call runSingleScript.cmd XMLselectionViews\pricingengine.sql
call runSingleScript.cmd XMLselectionViews\sensitivity.sql
call runSingleScript.cmd XMLselectionViews\simulation.sql
call runSingleScript.cmd XMLselectionViews\stresstest.sql
call runSingleScript.cmd XMLselectionViews\todaysmarket.sql

call runSingleScript.cmd Data\ore_types.sql
call runSingleScript.cmd Data\ore_typesOther.sql
call runSingleScript.cmd Data\pricingengine.sql 
call runSingleScript.cmd Data\conventions.sql
call runSingleScript.cmd Data\todaysmarket.sql
call runSingleScript.cmd Data\curveconfig.sql
call runSingleScript.cmd Data\ore_typesOther2.sql
call runSingleScript.cmd Data\ore.sql
call runSingleScript.cmd Data\netting.sql
call runSingleScript.cmd Data\simulation.sql
call runSingleScript.cmd Data\portfolio.sql
call runSingleScript.cmd Data\stresstest.sql
call runSingleScript.cmd Data\sensitivity.sql
call runSingleScript.cmd Data\marketdata.sql
call runSingleScript.cmd Data\covariancedata.sql
call runSingleScript.cmd Data\fixingdata.sql

pause