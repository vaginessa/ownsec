#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

4.Password
${normal}"

################## 4.Password ##################
## 1.Network
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/brut3k1t
./brut3k1t-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/brutex
./brutex-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/findmyhash
./findmyhash-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/f-scrack
./f-scrack-update.sh
#cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/keimpx
#./keimpx-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/medusa
./medusa-update.sh
#cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/ncrack
#./ncrack-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/onesixtyone
./onesixtyone-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/patator
./patator-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/thc-hydra
./thc-hydra-update.sh
#cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/thc-pptp-bruter
#./thc-pptp-bruter-update.sh

## 2.Local

cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/HASHCAT
./hashcat-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/johnny
./johnny-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/johntheripper
./johntheripper-update.sh
#cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/ophcrack
#./ophcrack-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/pack
./pack-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/pyrit
./pyrit-update.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/rainbowcrack-ng
./rainbowcrack-ng-update.sh

### 1.WEP_WPA

cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/1.WEP_WPA/cowpatty
./cowpatty-update.sh

### 2.NVIDIA-ONLY - not installed by default
#cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/2.NVIDIA-ONLY/truecrack
#./truecrack-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
3.Exploitation-Tools
${normal}"