#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

8.Tunnel
${normal}"

################## 8.Tunnel ##################

## 1.Pivot

#cd /opt/ITSEC-Install-Scripts/8.Tunnel/1.Pivot/3proxy

cd /opt/ITSEC-Install-Scripts/8.Tunnel/1.Pivot/pivoter
./pivoter-update.sh
# main

#cd /opt/ITSEC-Install-Scripts/8.Tunnel/anonym8
#./anonym8-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/dns2tcp
./dns2tcp-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/exe2hex
./exe2hex-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/iodine
./iodine-update.sh
#cd /opt/ITSEC-Install-Scripts/8.Tunnel/mallory
#./mallory-update.sh
#cd /opt/ITSEC-Install-Scripts/8.Tunnel/miredo
#./miredo-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/proxychains-ng
./proxychains-ng-update.sh
#cd /opt/ITSEC-Install-Scripts/8.Tunnel/proxytunnel
#./proxytunnel-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/ptunnel
./ptunnel-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/pwnat
./pwnat-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/sslh
./sslh-update.sh
#cd /opt/ITSEC-Install-Scripts/8.Tunnel/stunnel
#./stunnel-update.sh
cd /opt/ITSEC-Install-Scripts/8.Tunnel/udptunnel
./udptunnel-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
6.Wireless
${normal}"
