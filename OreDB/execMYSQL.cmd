echo ----: doing %1>> SQL.log
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -f -uYourPrivilegedUser -pYourSecretPassword < %1 >> SQL.log 2>&1