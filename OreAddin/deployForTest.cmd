Set /P answr=deploy (r)elease (empty for debug)? 
@echo off
set source=bin\Debug
If "%answr%"=="r" (
	set source=bin\Release
)
if exist "C:\Program Files\Microsoft Office\root\" (
	echo 64bit office
	copy /Y %source%\OREaddin-AddIn64-packed.xll "%appdata%\Microsoft\AddIns\OREaddin.xll"
	copy /Y %source%\OREaddin.pdb "%appdata%\Microsoft\AddIns"
	copy /Y %source%\OREaddin.dll.config "%appdata%\Microsoft\AddIns\OREaddin.xll.config"
) else (
	echo 32bit office
	copy /Y %source%\OREaddin-AddIn-packed.xll "%appdata%\Microsoft\AddIns\OREaddin.xll"
	copy /Y %source%\OREaddin.pdb "%appdata%\Microsoft\AddIns"
	copy /Y %source%\OREaddin.dll.config "%appdata%\Microsoft\AddIns\OREaddin.xll.config"
)
if "%source%"=="bin\Release" (
	echo copying Distribution
	copy /Y %source%\OREaddin-AddIn64-packed.xll "..\Distribution\OREaddin64.xll"
	copy /Y %source%\OREaddin-AddIn-packed.xll "..\Distribution\OREaddin32.xll"
	copy /Y %source%\OREaddin.dll.config "..\Distribution\OREaddin.xll.config"
)
pause
