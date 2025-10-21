# TouchDesigner Slamtec Lidar support for MacOS

This is a fork of Ajasra (Vasily’s) Slamtec Lidar CPlusPlus CHOP for TouchDesigner. This plugin was built with Gemini-CLI by editing and rebuilding the original project files.

### Supported:
RPLIDAR A1 / A2 / A3 / S1 / S2 / S3 BUT tested with only an A1M8 on an M1 Pro and M3 Max with MacOS Sequoia 

### Quarantine:
Since this app was not built on your machine it might not load into TouchDesigner, this can be fixed by removing the quarantine attribute associated with the plugin, below are the steps.

1. Locate the plugin in the downloaded folder
2. Open up a terminal window
3. Type in ```xattr -d com.apple.quarantine ```
4. Drag and drop the plugin into the terminal window, and click enter
5. Your plugin should now load in TouchDesigner

### Setup:
1. Please make sure CP210x drivers are installed from [here](https://www.silabs.com/software-and-tools/usb-to-uart-bridge-vcp-drivers?tab=downloads)
2. Restart your machine for drivers to take effect
3. Find the name of your port by running ```ls /dev/tty.*``` in the terminal
4. Paste the name of the port in the CHOP and set the correct baudrate for your model
5. Click Active, if the plugin doesn’t load click Re-init

You can add the infoDAT to see lidar information.

### Compiling:
1. cd to the main directory of the folder
2. Clone the original [rplidar-sdk](https://github.com/Slamtec/rplidar_sdk)
3. Make a new build directory by ```mkdir build``` and ```cd build```
4. Run ```cmake ..```
5. Compile the plugin using ```make```

