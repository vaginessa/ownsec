#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

6.Wireless
${normal}"

################## 6.Wireless ##################

## 1.Wifi
### 1.WPS
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS/bully
./bully-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS/pixiewps
./pixiewps-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS/reaver-wps
./reaver-wps-update.sh

### 2.Routerkeys
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc
./routerkeygenpc-update.sh

### 3.Jammer

cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/mdk3-master
./mdk3-master-update.sh
./wifijammer-update.sh

### 4.Evil-Twin

cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
./hostapd-wpe-update.sh

# main

cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/Aircrack
./Aircrack-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/aircrack-ng
./aircrack-ng-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/airgeddon
./airgeddon-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/atear
./atear-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/boopsuite
./boopsuite-update.sh
# not a git repo
#cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/eapmd5pass
#./eapmd5pass-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/fern-wifi-cracker
./fern-wifi-cracker-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/fruitywifi
./fruitywifi-update.sh
# buggy?!?
#cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/handshaker
#./handshaker-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/kismet
./kismet-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/wifi-pumpkin
./wifi-pumpkin-update.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/wpa2-halfhandshake-crack
./wpa2-halfhandshake-crack-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
6.Wireless
${normal}"