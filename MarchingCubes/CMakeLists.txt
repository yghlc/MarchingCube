cmake_minimum_required (VERSION 2.6)
project (MarchingCubes)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../.)

set(CMAKE_VERBOSE_MAKEFILE ON)
#include_directories( "${PROJECT_SOURCE_DIR}/../include" )
include_directories( "${PROJECT_SOURCE_DIR}" )

SET(SRC_LIST main.cpp MarchingCubes.cpp )

FIND_PACKAGE(GDAL REQUIRED)

#SET(EXTRA_LIBS /usr/local/lib/libgdal.1.dylib)
#SET(EXTRA_LIBS libgdal.1.dylib)
#SET(EXTRA_LIBS libgdal.so)

#message( ${GDAL_LIBRARY} )

#ADD_DEFINITIONS(-D__LINUX__)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=gnu++0x")

add_executable(marchingCubes ${SRC_LIST} )
#target_link_libraries(filteroffset  ${GDAL_LIBRARY})
