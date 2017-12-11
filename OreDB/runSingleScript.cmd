echo ----: doing %1>> sql.log
sqlcmd -S LENOVO-PC -r1 -E -i %1 2>> sql.log