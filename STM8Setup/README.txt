*Note* In order to use this you need to install STVP from ST. It is free and the command line
version is used to flash to the STM8

To compile all you need to do is open up command prompt in this directory and execute "run".
It will then compile and attempt to flash the code to an STM8 if it detects it.

Changelog:
V1:
Initial code setup and batch file configurations

V1.1:
UART and Timer implementation (timer is used for systick delays)

V2:
Visual Studio project setup
CAN and I2C implementation

V2.1:
Add code for CAN and I2C initialization for compiling demonstration