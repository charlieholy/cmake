cmake_minimum_required(VERSION 3.17)
project(ProjectName)
include(arch.cmake)
include(argc.cmake)
enable_testing()
macro(add_gtest NAME_)
  argc_checker( ${ARGC} 2 "no sources given for test: ${NAME_}")
  add_executable(${NAME_} ${ARGN})
  add_test(NAME ${NAME_} COMMAND ${NAME_} " > 1.txt" )
endmacro(add_gtest)


add_gtest(charlie testcase1.cpp)
