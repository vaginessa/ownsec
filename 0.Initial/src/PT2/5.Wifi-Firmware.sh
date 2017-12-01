#!/bin/bash

#sudo apt-get update
#sudo apt-get install git linux-headers-generic build-essential dkms

# doesent build on gcc 4.7

#############################################
####################### 8812

# rtl8812AU

### aircrack-ng/rtl8812au
### RTL8812AU/21AU and RTL8814AU driver with monitor mode and frame injection 

mkdir -p /opt/DRVR/WIFI/8812/aircrack-ng
cd /opt/DRVR/WIFI/8812/aircrack-ng
git clone -b v5.1.5 https://github.com/aircrack-ng/rtl8812au
cd rtl8812au
 
git checkout v5.1.5
make clean
git clean -f
git pull
# make -j 4
# sudo make install
# sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
chmod +x dkms-install.sh 
sudo ./dkms-install.sh

#############################################
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
sudo dkms add .
sudo dkms install rtl8192eu/1.0

#############################################
