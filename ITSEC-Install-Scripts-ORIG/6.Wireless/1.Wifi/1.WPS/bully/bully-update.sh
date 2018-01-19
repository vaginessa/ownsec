#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/aanarchyy/bully
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy/bully
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy/bully/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/1.WPS/bully
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS/bully
DSKTPFL=bully.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/1.WPS/bully
#ph1a

echo "${bold}
 ____  _   _ _     _  __   __
| __ )| | | | |   | | \ \ / /
|  _ \| | | | |   | |  \ V / 
| |_) | |_| | |___| |___| |  
|____/ \___/|_____|_____|_|  
       
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
sudo make clean
GITRESET
GITSBMDLINIT

cd src
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


