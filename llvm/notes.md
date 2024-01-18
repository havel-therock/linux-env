# clang-tidy
To use it in a project 'clang-tidy' needs 'compile command database' of the project. It is a `compile_commands.json`
file that describes project.The easiest way to generate such file is with CMake build.Just run this inside your build
directory(out /):
```
cmake<path to a root CMakeLists.txt> -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

Example of the command:
```
clang-tidy --checks="*" -header-filter=".*"  -p ./ ../src/test.cpp
```
Useful cmds:
* -list-checks
* -fix


Check for modernize advices:
```
clang-tidy --checks="modernize*" -header-filter=".*"  -p ./ ../src/*.cpp
```
