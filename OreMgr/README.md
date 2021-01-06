# ORE Mgr

OREMgr provides a SWIG Interface and a .NET DLL wrapper to ORE (for ORE Addin and other applications)

For details see [OREMgr](https://rkapl123.github.io/OreControl/OREMgr.html)

Build hints for Visual Studio: always use consistent processor architecture, as otherwise you will get runtime problems when executing the generated pINVOKEs.
So, for x64 builds:
- C++ builds are done by selecting x64 in the project platform selector
- C# builds are done by selecting x64 as target platform in the build tab of the project.

for x86 builds do the same as above, but using x86. Strictly avoid selecting AnyCPU as target plattform (build section) in all projects, always set to x86 or x64!
The c++ dll always has to be included in the path of the executable/.NET library and has to be named TreeizeRelD.dll

For DLL Builds you have to also include the .obj build file in the additional dependencies of the depending project (e.g. a c++ test project). 
This has to be from the correct build environment (so Release -> $(ProjectDir)..\build\x64\Release\treeizereld.obj and Debug -> $(ProjectDir)..\build\x64\Debug\treeizereld.obj)

Debugging hints for Visual Studio:
For debugging the mixed (swig) code environments, set the debugger type in the C++ project to mixed (.NET Standard) and in the C# Project, activate „not managed Codedebugging“.
