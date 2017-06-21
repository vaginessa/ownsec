#!/bin/bash


#rtl8812AU
mkdir -p /opt/DRVR/WIFI/8812/rtl8812au/astsam
sudo chown -R $USER/$USER /opt
cd /opt/DRVR/WIFI/8812/rtl8812au/astsam
git clone https://github.com/astsam/rtl8812au
cd rtl8812au

make clean
git clean -f
git pull
make -j 4
sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
sudo make install
sudo modprobe -a 8812au


#RTL8192EU
mkdir -p /opt/DRVR/WIFI/8192/rtl8192eu/masterzorag
sudo chown -R $USER/$USER /opt
cd /opt/DRVR/WIFI/8192/rtl8192eu/masterzorag
git clone https://github.com/masterzorag/RTL8192EU-linux
cd RTL8192EU-linux

make clean
git clean -f
git pull
git checkout linux-4.11
make -j 4
sudo make install