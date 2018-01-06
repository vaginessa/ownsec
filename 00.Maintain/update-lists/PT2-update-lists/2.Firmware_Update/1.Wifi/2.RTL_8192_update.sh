#!/bin/bash

####################### 8192

# RTL8192EU

### Mange/rtl8192eu-linux-driver
### Drivers for the rtl8192eu chipset for wireless adapters (D-Link DWA-131 rev E1 included!) 

mkdir -p /opt/DRVR/WIFI/8192/rtl8192eu-linux-driver/Mange
cd /opt/DRVR/WIFI/8192/rtl8192eu-linux-driver/Mange
git clone https://github.com/Mange/rtl8192eu-linux-driver
cd rtl8192eu-linux-driver
# cd /usr/src/rtl8192eu
# sudo make clean
# sudo make
# sudo make install
# sudo modprobe -a rtl8192eu

sudo dkms remove rtl8192eu/1.0 --all

sudo dkms add .
sudo dkms install rtl8192eu/1.0
sudo dkms status