
cmake_minimum_required(VERSION 3.10)

project(SlamtecCHOP)

if (APPLE)
	set(CMAKE_CXX_STANDARD 17)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -stdlib=libc++")
endif()

set(OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/plugin)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})

# Define the plugin name
set(PLUGIN_NAME Slamtec)

# Define source files
set(SOURCES
    SlamtecCHOP.cpp
    Parameters.cpp
    drvlogic/RPLidarDevice.cpp
)

# RPLiDAR SDK
set(RPLIDAR_SDK_PATH /Users/aaronpereira/RPLiDar/rplidar_ros-2.1.5)
include_directories(${RPLIDAR_SDK_PATH}/sdk/include ${RPLIDAR_SDK_PATH}/sdk/src)
link_directories(${RPLIDAR_SDK_PATH}/output/Darwin/Release)

# TouchDesigner headers
include_directories(.)

# Add the plugin as a shared library
add_library(${PLUGIN_NAME} MODULE ${SOURCES})

set_target_properties(${PLUGIN_NAME} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${PLUGIN_NAME} PROPERTIES PREFIX "")
set_target_properties(${PLUGIN_NAME} PROPERTIES BUNDLE TRUE)
set_target_properties(${PLUGIN_NAME} PROPERTIES BUNDLE_EXTENSION "plugin")

# Link against RPLiDAR SDK
target_link_libraries(${PLUGIN_NAME} PRIVATE rplidar_sdk)

