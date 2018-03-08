#!/bin/bash

# something stopped working, check again

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/jmk-foofus/medusa.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus/medusa
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/medusa
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/medusa
DSKTPFL=medusa.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/medusa
#ph1a
echo "${bold}
 __  __ _____ ____  _   _ ____    _    
|  \/  | ____|  _ \| | | / ___|  / \   
| |\/| |  _| | | | | | | \___ \ / _ \  
| |  | | |___| |_| | |_| |___) / ___ \ 
|_|  |_|_____|____/ \___/|____/_/   \_\
              
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-medusa.txt") -r -- sudo apt-get install -y

### DEPS END

make clean
GITSBMDLINIT
mkdir deps
cd deps

git clone https://github.com/simonvetter/afpfs-ng
cd afpfs-ng
make clean
GITSBMDLINIT
./configure
make -j 4 
sudo make install

cd $GITREPOROOT
./configure 
make -j 4
sudo make install

#333d
CPDESKTFL





