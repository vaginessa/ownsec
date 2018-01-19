#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/routerkeygen/routerkeygenPC.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/routerkeygenpc
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/routerkeygenpc
DSKTPFL=bully.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/routerkeygenpc
#hd6cv

echo "${bold}
 ____ _____ ____  _  _________   ______ _____ _   _ ____   ____ 
|  _ \_   _|  _ \| |/ / ____\ \ / / ___| ____| \ | |  _ \ / ___|
| |_) || | | |_) | ' /|  _|  \ V / |  _|  _| |  \| | |_) | |    
|  _ < | | |  _ <| . \| |___  | || |_| | |___| |\  |  __/| |___ 
|_| \_\|_| |_| \_\_|\_\_____| |_| \____|_____|_| \_|_|    \____|
       
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
sudo rm -r build
mkdir build
cd build
sudo make uninstall
make clean
cd ..
GITRESET
#GITSBMDLINIT
cd build
cmake ..
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


