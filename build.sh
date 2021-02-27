#!/bin/bash
cmake -E make_directory "build"
#cmake -E chdir "build" cmake -DCMAKE_BUILD_TYPE=Release ../
cmake -DCMAKE_BUILD_TYPE=Release -S . -B "build"
cmake --build "build" --config Release
cmake -E chdir "build" ctest --build-config Release
