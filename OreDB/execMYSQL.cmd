echo ----: doing %1>> SQL.log
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -f -u root -proot < %1 >> SQL.log 2>&1
