#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/wiire-a/pixiewps.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a/pixiewps
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/1.WPS/pixiewps
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS/pixiewps
DSKTPFL=pixiewps.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/1.WPS/pixiewps
#ph1a
echo "${bold}
 ____ _____  _____ _______        ______  ____  
|  _ \_ _\ \/ /_ _| ____\ \      / /  _ \/ ___| 
| |_) | | \  / | ||  _|  \ \ /\ / /| |_) \___ \ 
|  __/| | /  \ | || |___  \ V  V / |  __/ ___) |
|_|  |___/_/\_\___|_____|  \_/\_/  |_|   |____/ 
        
INSTALL
${normal}"

#plh11
GITCLONEFUNC
#cd src
make clean
GITSBMDLINIT
make -j 4
sudo make install
#333d
CPDESKTFL