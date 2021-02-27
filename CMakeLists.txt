cmake_minimum_required(VERSION 3.17)
project(ProjectName)
include(argc.cmake)

macro(add_gtest NAME_)
  argc_checker( ${ARGC} 2 "no sources given for test: ${NAME_}")
endmacro(add_gtest)

add_gtest(charlie)
