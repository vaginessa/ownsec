#!/bin/bash


rtl8812AU
mkdir -p /opt/DRVR/WIFI/8812/rtl8812au/astsam

cd /opt/DRVR/WIFI/8812/rtl8812au/astsam
git clone https://github.com/astsam/rtl8812au
cd rtl8812au

make clean
make -j 4
sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
sudo make install
sudo modprobe -a 8812au

######################################################################
#rtl8812AU
#mkdir -p /opt/DRVR/WIFI/8812/rtl8812au/kimocoder
#cd /opt/DRVR/WIFI/8812/rtl8812au/kimocoder
#git clone https://github.com/kimocoder/rtl8812au
#cd rtl8812au
#make clean
#git clean -f
#git pull
#make -j 4
#sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
#sudo make install
#sudo modprobe -a 8812au
######################################################################
#mkdir -p /opt/DRVR/WIFI/8812/rtl8812AU/diederikdehaas
#cd /opt/DRVR/WIFI/8812/rtl8812AU/diederikdehaas
#git clone https://github.com/diederikdehaas/rtl8812AU
#cd rtl8812AU
#make clean
#git clean -f
#git pull
#make -j 4
#sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
#sudo make install
#sudo modprobe -a 8812au
######################################################################
#mkdir -p /opt/DRVR/WIFI/8812/rtl8812au/gordboy
#cd /opt/DRVR/WIFI/8812/rtl8812au/gordboy
#git clone https://github.com/gordboy/rtl8812au
#cd rtl8812au
#make clean
#git clean -f
#git pull
#make -j 4
#sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
#sudo make install
#sudo modprobe -a 8812au
######################################################################
#mkdir -p /opt/DRVR/WIFI/8812/aircrack-ng

#cd /opt/DRVR/WIFI/8812/aircrack-ng
#git clone -b v5.1.5  https://github.com/aircrack-ng/rtl8812au
#cd rtl8812au
 
#git checkout v5.1.5
#make clean
#git clean -f
#git pull
#make -j 4


########################################################

#evilphish

#rtl8812AU
#mkdir -p /opt/DRVR/WIFI/8812/evilphish

#cd /opt/DRVR/WIFI/8812/evilphish
#git clone -b v5.1.5  https://github.com/evilphish/rtl8812au
#cd rtl8812au
 
#git checkout v5.1.5
#make clean
#git clean -f
#git pull
#make -j 4

############################################
#rtl8812AU
mkdir -p /opt/DRVR/WIFI/8812/rtl8812au/gnab
cd /opt/DRVR/WIFI/8812/rtl8812au/gnab
git clone https://github.com/gnab/rtl8812au
cd rtl8812au

make
sudo insmod 8812au.ko
sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
sudo depmod
#############################################
#RTL8192EU
#mkdir -p /opt/DRVR/WIFI/8192/rtl8192eu/$BRANCHzorag

#cd /opt/DRVR/WIFI/8192/rtl8192eu/$BRANCHzorag
#git clone https://github.com/$BRANCHzorag/RTL8192EU-linux
#cd RTL8192EU-linux

#make clean
#git clean -f
#git pull
#git checkout linux-4.11
#make -j 4
#sudo make install
############################################

#sudo apt-get update
#sudo apt-get install git linux-headers-generic build-essential dkms
#mkdir -p /opt/DRVR/WIFI/8192/rtl8192cu-fixes/pvaret
#cd /opt/DRVR/WIFI/8192/rtl8192cu-fixes/pvaret
#git clone https://github.com/pvaret/rtl8192cu-fixes
#cd rtl8192cu-fixes
#sudo dkms add ./rtl8192cu-fixes
#sudo dkms install 8192cu/1.10
#sudo depmod -a
#sudo cp ./rtl8192cu-fixes/blacklist-native-rtl8192.conf /etc/modprobe.d/
#make -j 4
#sudo make install

############################################