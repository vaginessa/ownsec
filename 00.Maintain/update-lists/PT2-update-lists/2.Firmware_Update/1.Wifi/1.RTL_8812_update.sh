#!/bin/bash

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
chmod +x dkms-remove.sh
chmod +x dkms-install.sh
sudo ./dkms-remove.sh
sudo ./dkms-install.sh
sudo dkms status