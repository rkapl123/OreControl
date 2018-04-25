echo ----: doing %1>> MYSQL.log
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -f -u root -proot < %1 >> MYSQL.log 2>&1
