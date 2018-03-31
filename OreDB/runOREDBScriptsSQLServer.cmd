echo starting ORE DB Creation scripts > sql.log
call runSingleScript.cmd oreDBCreate.sql
call runSingleScript.cmd Tables\ore_typesTables.sql
call runSingleScript.cmd Tables\pricingengineTables.sql
call runSingleScript.cmd Tables\conventionsTables.sql
call runSingleScript.cmd Tables\todaysmarketTables.sql
call runSingleScript.cmd Tables\curveconfigTables.sql
call runSingleScript.cmd Tables\oreTables.sql
call runSingleScript.cmd Tables\nettingTables.sql
call runSingleScript.cmd Tables\simulationTables.sql
call runSingleScript.cmd Tables\portfolioTables.sql
call runSingleScript.cmd Tables\stresstestTables.sql
call runSingleScript.cmd Tables\sensitivityTables.sql
call runSingleScript.cmd Tables\marketdataTables.sql
call runSingleScript.cmd Tables\resultsTables.sql

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
call runSingleScript.cmd Data\marketfixingdata.sql

pause