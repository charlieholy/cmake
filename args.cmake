macro(argc_checker HAVING EXPECTED)
 if(${HAVING} LESS ${EXPECTED})
    message( FATAL_ERROR "${ARGN}")
 endif()
endmacro(argc_checker)