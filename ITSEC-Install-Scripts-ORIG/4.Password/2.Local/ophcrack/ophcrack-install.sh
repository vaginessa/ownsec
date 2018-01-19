#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/luisgg/ophcrack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/ophcrack/luisgg/ophcrack
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/ophcrack/luisgg
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/ophcrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/ophcrack
DSKTPFL=ophcrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/ophcrack
#ph1a

echo "${bold}
  ___  ____  _   _        ____ ____      _    ____ _  __
 / _ \|  _ \| | | |      / ___|  _ \    / \  / ___| |/ /
| | | | |_) | |_| |_____| |   | |_) |  / _ \| |   | ' / 
| |_| |  __/|  _  |_____| |___|  _ <  / ___ \ |___| . \ 
 \___/|_|   |_| |_|      \____|_| \_\/_/   \_\____|_|\_\
           
INSTALL   
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-ophcrack.txt") -r -- sudo apt-get install -y
### DEPS END

make clean
GITSBMDLINIT
./configure
make -j 4
sudo make install
#333d
CPDESKTFL