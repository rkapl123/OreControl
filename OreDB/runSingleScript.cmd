echo ----: doing %1>> MSSQL.log
sqlcmd -S LENOVO-PC -r1 -E -i %1 2>> MSSQL.log
