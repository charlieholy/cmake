cmake_minimum_required(VERSION 3.17)
project(ProjectName)

#get_filename_component( GNB_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" REALPATH)
message("CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")
#message("GNB_DIR: ${GNB_DIR}")
message("csdk path: ${CSDK}")


list( APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}" )


include(arch)
include(args)
include(gen_Itf)
include(findlib)
enable_testing()
macro(add_gtest NAME_)
  argc_checker( ${ARGC} 2 "no sources given for test: ${NAME_}")
  add_executable(${NAME_} ${ARGN})
  add_test(NAME ${NAME_} COMMAND ${NAME_} " > 1.txt" )
endmacro(add_gtest)


add_gtest(charlie testcase1.cpp)
