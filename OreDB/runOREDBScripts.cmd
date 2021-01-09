echo starting ORE DB Creation scripts > SQL.log
set runscript=%1
if "%runscript%" == "" (
	set runscript=execMSSQL.cmd
)
set databasetype=%runscript:~-9,-4%

set dbcreatescript=%2
if "%dbcreatescript%" == "" (
		set dbcreatescript=oreDBCreate%databasetype%.sql
)
call %runscript% %dbcreatescript%
call %runscript% Tables\TypesTables.sql
call %runscript% Tables\MdatTables.sql
call %runscript% Tables\NettingTables.sql
call %runscript% Tables\PortfolioTables.sql
call %runscript% Tables\ResultsTables.sql
call %runscript% Tables\ConfigTables.sql

if "%databasetype%" == "MSSQL" (
	call %runscript% XMLselectionViews\netting.sql
	call %runscript% XMLselectionViews\portfolio.sql
        call %runscript% Tables\MdatMarketDataDefView.sql
)

call %runscript% Data\ore_types.sql
call %runscript% Data\ore_typesOther.sql
call %runscript% Data\ore_typesParties.sql
call %runscript% Data\marketdata.sql
call %runscript% Data\netting.sql
call %runscript% Data\portfolio.sql
call %runscript% Data\covariancedata.sql
call %runscript% Data\fixingdata.sql
call %runscript% Data\configTablepricingengine.sql
call %runscript% Data\configTablestresstest.sql
call %runscript% Data\configTabletodaysmarket.sql
call %runscript% Data\configTableore.sql
call %runscript% Data\configTablesensitivity.sql
call %runscript% Data\configTablesimulation.sql
call %runscript% Data\configTableconventions.sql
call %runscript% Data\configTablecurveconfig.sql
pause
