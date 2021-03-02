# Determine the target architecture
#
# Taken from Richard Maxwell's 'sewing' library: https://github.com/JodiTheTigger/sewing
# (MIT license)

if (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
    set(CONTEXT_PLATFORM "x86_64")
endif()

if (CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64")
    set(CONTEXT_PLATFORM "x86_64")
endif()

if (CMAKE_SYSTEM_PROCESSOR STREQUAL "i386")
    set(CONTEXT_PLATFORM "i386")
endif()

if (CONTEXT_PLATFORM STREQUAL "x86_64")
    if("${CMAKE_SIZEOF_VOID_P}" EQUAL "4")
        set(CONTEXT_PLATFORM "i386")
    endif()
endif()

if (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
    if("${CMAKE_SIZEOF_VOID_P}" EQUAL "8")
        set(CONTEXT_PLATFORM "arm64")
    else()
        set(CONTEXT_PLATFORM "arm")
    endif()

    set(CONTEXT_OS "aapcs")
endif()

# https://www.phoronix.com/scan.php?page=news_item&px=MTY5ODk
if (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    set(CONTEXT_PLATFORM "arm64")
    set(CONTEXT_OS "aapcs")
endif()

if(APPLE)
    set(CONTEXT_OS  "sysv")
    set(CONTEXT_ABI "macho")
    set(CONTEXT_ASM "gas.S")
elseif(UNIX)
    # arm requires aapcs. So we have to check if arm already set the calling convention
    if (NOT CONTEXT_OS)
        set(CONTEXT_OS "sysv")
    endif()
    set(CONTEXT_ABI "elf")
    set(CONTEXT_ASM "gas.S")
endif()

message(STATUS "-- System          : ${CMAKE_SYSTEM}")
message(STATUS "-- System processor: ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "-- Target processor: ${CONTEXT_PLATFORM}")
message(STATUS "-- Target asm      : ${CONTEXT_PLATFORM}_${CONTEXT_OS}_${CONTEXT_ABI}_${CONTEXT_ASM}")
