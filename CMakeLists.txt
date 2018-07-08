cmake_minimum_required(VERSION 3.9)
project(ppcaltivec)

set(CMAKE_CXX_STANDARD 11)

if(NOT IS_DIRECTORY "${IDASDK}")
    set(IDASDK "" CACHE STRING "Path to IDA SDK directory")
endif()

include_directories("${IDASDK}/include")

add_library(ppcaltivec SHARED plugin.cpp)

set_target_properties(ppcaltivec PROPERTIES PREFIX "")

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(ppcaltivec PROPERTIES OUTPUT_NAME "ppcaltivec64")
    target_compile_definitions(ppcaltivec PRIVATE __EA64__=1 __X64__=1)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
endif()

if(CMAKE_HOST_WIN32)
    target_compile_definitions(ppcaltivec PRIVATE __NT__=1)
    set(IDA_LIB_DIR "win_vc")
endif()

if(CMAKE_HOST_APPLE)
    target_compile_definitions(ppcaltivec PRIVATE __MAC__=1)
    set(IDA_LIB_DIR "mac_gcc")
elseif(CMAKE_HOST_UNIX)
    target_compile_definitions(ppcaltivec PRIVATE __LINUX__=1)
    set(IDA_LIB_DIR "linux_gcc")
endif()


if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    find_library(IDA_LIB NAMES ida64 HINTS "${IDASDK}/lib/x64_${IDA_LIB_DIR}_64")
else()
    find_library(IDA_LIB NAMES ida HINTS "${IDASDK}/lib/x86_${IDA_LIB_DIR}_32")
endif()


target_link_libraries(ppcaltivec ${IDA_LIB})