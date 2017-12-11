Set /P answr=deploy (r)elease? 
set source=bin\Debug
If "%answr%"=="r" (
set source=bin\Release
)
copy /Y %source%\Raddin-AddIn64-packed.xll "%appdata%\Microsoft\AddIns"
copy /Y %source%\Raddin.pdb "%appdata%\Microsoft\AddIns"
copy /Y %source%\Raddin.dll.config "%appdata%\Microsoft\AddIns\Raddin-AddIn64-packed.xll.config"
copy /Y bin\Release\Raddin-AddIn64-packed.xll .
copy /Y bin\Release\Raddin.dll.config .\Raddin-AddIn64-packed.xll.config
pause

