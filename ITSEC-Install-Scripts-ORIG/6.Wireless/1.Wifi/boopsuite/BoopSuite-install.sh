#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/MisterBianco/BoopSuite
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/boopsuite
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/boopsuite
DSKTPFL=boopsniff_gui.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/boopsuite
#ph1a
echo "${bold}
 ____                   ____        _ _       
| __ )  ___   ___  _ __/ ___| _   _(_) |_ ___ 
|  _ \ / _ \ / _ \| '_ \___ \| | | | | __/ _ \
| |_) | (_) | (_) | |_) |__) | |_| | | ||  __/
|____/ \___/ \___/| .__/____/ \__,_|_|\__\___|
                  |_|        
INSTALL            
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo python install.py

#333d 
CPDESKTFL
