#!/bin/bash


#rtl8812AU
mkdir -p /opt/DRVR/WIFI/8812/rtl8812au/astsam

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
#mkdir -p /opt/DRVR/WIFI/8192/rtl8192eu/masterzorag

#cd /opt/DRVR/WIFI/8192/rtl8192eu/masterzorag
#git clone https://github.com/masterzorag/RTL8192EU-linux
#cd RTL8192EU-linux

#make clean
#git clean -f
#git pull
#git checkout linux-4.11
#make -j 4
#sudo make install

sudo apt-get update
sudo apt-get install git linux-headers-generic build-essential dkms


mkdir -p /opt/DRVR/WIFI/8192/rtl8192cu-fixes/pvaret

cd /opt/DRVR/WIFI/8192/rtl8192cu-fixes/pvaret
git clone https://github.com/pvaret/rtl8192cu-fixes

cd rtl8192cu-fixes

sudo dkms add ./rtl8192cu-fixes

sudo dkms install 8192cu/1.10

sudo depmod -a

sudo cp ./rtl8192cu-fixes/blacklist-native-rtl8192.conf /etc/modprobe.d/


make -j 4
sudo make install