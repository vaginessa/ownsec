#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/nmap/ncrack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/ncrack/nmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/ncrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/ncrack
DSKTPFL=ncrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/ncrack
#ph1a
echo "${bold}
 _   _  ____ ____      _    ____ _  __
| \ | |/ ___|  _ \    / \  / ___| |/ /
|  \| | |   | |_) |  / _ \| |   | ' / 
| |\  | |___|  _ <  / ___ \ |___| . \ 
|_| \_|\____|_| \_\/_/   \_\____|_|\_\
          
/nmap/ncrack
INSTALL
${normal}"

#plh11

GITCLONEFUNC

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-ncrack.txt") -r -- sudo apt-get install -y
# sudo updatedb
# sudo ldconfig

GITSBMDLINIT

./configure
make -j 4
sudo make install

#333d
CPDESKTFL
