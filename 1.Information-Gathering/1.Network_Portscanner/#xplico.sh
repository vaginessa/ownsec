#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__  ______  _     ___ ____ ___  
\ \/ /  _ \| |   |_ _/ ___/ _ \ 
 \  /| |_) | |    | | |  | | | |
 /  \|  __/| |___ | | |__| |_| |
/_/\_\_|   |_____|___\____\___/ 
            
${normal}"



mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico
git clone https://github.com/xplico/xplico.git
#


cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico/xplico
