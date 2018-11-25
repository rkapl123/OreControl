rem C:\dev\git\Engine\sql\
set scriptdir=C:\dev\git\OreControl\OreDB
runas /user:OEBFACOAT\a_%username:~1% "cmd.exe /k cd %scriptdir% & runOREDBScripts.cmd execOebfaMSSQL.cmd oreDBCreateMSSQLOeBFA.sql"
