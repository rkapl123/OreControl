# ORE Mgr

OREMgr provides a SWIG Interface and a .NET DLL wrapper to ORE (for ORE Addin and other applications)

For details see [OREMgr](https://rkapl123.github.io/OreControl/OREMgr.html)

Build hints for Visual Studio: always use consistent processor architecture, as otherwise you will get runtime problems when executing the generated pINVOKEs.
So, for x64 builds:
- C++ builds are done by selecting x64 in the project platform selector
- C# builds are done by selecting x64 as target platform in the build tab of the project.

for x86 builds do the same as above, but using x86. Avoid selecting AnyCPU !
The c++ dll always has to be included in the path of the executable/.NET library and has to be named TreeizeRelD.dll