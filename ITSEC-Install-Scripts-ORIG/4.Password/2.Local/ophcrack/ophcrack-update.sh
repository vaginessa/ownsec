#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/luisgg/ophcrack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/ophcrack/luisgg/ophcrack
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/ophcrack/luisgg/ophcrack/.git
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
           
UPDATE   
${normal}"
GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
./configure
make -j 4
sudo make install
#333d
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

