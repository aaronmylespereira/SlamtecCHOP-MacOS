# Makefile for SlamtecCHOP TouchDesigner Plugin on macOS

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++14 -arch arm64 -O2 -Wall -shared -fPIC
LDFLAGS = -Wl,-all_load
MACOS_FLAGS = -mmacosx-version-min=11.0 -framework CoreFoundation -framework AppKit

# Directories
RPLIDAR_SDK_PATH = /Users/aaronpereira/RPLiDar/rplidar_ros-2.1.5
PLUGIN_NAME = Slamtec

# Source files
SRCS = SlamtecCHOP.cpp Parameters.cpp drvlogic/RPLidarDevice.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

# Include paths
INCLUDES = -I. \
           -I./drvlogic \
           -I$(RPLIDAR_SDK_PATH)/sdk/include \
           -I$(RPLIDAR_SDK_PATH)/sdk/src

# Library paths
LIB_PATHS = -L$(RPLIDAR_SDK_PATH)/output/Darwin/Release

# Libraries
LIBS = -lrplidar_sdk

# Target
TARGET = $(PLUGIN_NAME).plugin/Contents/MacOS/$(PLUGIN_NAME)

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(PLUGIN_NAME).plugin/Contents/MacOS
	$(CXX) $(CXXFLAGS) $(MACOS_FLAGS) -o $@ $(OBJS) $(LIB_PATHS) $(LIBS) $(LDFLAGS)
	@cp plugin/Slamtec.plugin/Contents/Info.plist $(PLUGIN_NAME).plugin/Contents/ 2>/dev/null || true

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -rf $(OBJS) $(PLUGIN_NAME).plugin

