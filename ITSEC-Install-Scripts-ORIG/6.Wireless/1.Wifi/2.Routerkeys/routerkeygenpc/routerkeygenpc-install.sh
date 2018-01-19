#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/routerkeygen/routerkeygenPC.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/routerkeygenpc
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/routerkeygenpc
DSKTPFL=bully.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/routerkeygenpc
#ph1a

echo "${bold}
 ____ _____ ____  _  _________   ______ _____ _   _ ____   ____ 
|  _ \_   _|  _ \| |/ / ____\ \ / / ___| ____| \ | |  _ \ / ___|
| |_) || | | |_) | ' /|  _|  \ V / |  _|  _| |  \| | |_) | |    
|  _ < | | |  _ <| . \| |___  | || |_| | |___| |\  |  __/| |___ 
|_| \_\|_| |_| \_\_|\_\_____| |_| \____|_____|_| \_|_|    \____|
       
INSTALL
${normal}"

#plh11

GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-routerkeygenPC.txt") -r -- sudo apt-get install -y
### DEPS END

sudo rm -r build
mkdir build
cd build
sudo make uninstall
make clean
cd ..
#GITSBMDLINIT
cd build
cmake ..
make -j 4
sudo make install
