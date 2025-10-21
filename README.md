# TouchDesigner Slamtec Lidar support for MacOS

This is a fork of Ajasra (Vasily’s) Slamtec Lidar CPlusPlus CHOP for TouchDesigner. This plugin was built with Gemini-CLI by editing and rebuilding the original project files.

### Supported:
RPLIDAR A1 / A2 / A3 / S1 / S2 / S3 BUT tested with only an A1M8 on an M1 Pro and M3 Max with MacOS Sequoia 

### Quarantine

### Setup:
1. Please make sure CP210x drivers are installed from [here](https://www.silabs.com/software-and-tools/usb-to-uart-bridge-vcp-drivers?tab=downloads)
2. Restart your machine for drivers to take effect
3. Find the name of your port by running ```ls /dev/tty.*``` in the terminal
4. Paste the name of the port in the CHOP and set the correct baudrate for your model
5. Click Active, if the plugin doesn’t load click Re-init

You can add the infoDAT to see lidar information.

### Compiling
1. Clone this repository
2. Clone the [rplidar sdk](https://github.com/Slamtec/rplidar_sdk)
3. Open in Visual Studio 2019
4. Add the rplidar SDK to the project
5. Follow [this steps](https://github.com/Slamtec/rplidar_sdk/issues/71#issuecomment-1382005055) to setup right linking
6. Build


