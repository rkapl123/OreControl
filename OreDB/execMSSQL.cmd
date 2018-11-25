echo ----: doing %1>> SQL.log
sqlcmd -S LENOVO-PC -r1 -E -i %1 2>> SQL.log
