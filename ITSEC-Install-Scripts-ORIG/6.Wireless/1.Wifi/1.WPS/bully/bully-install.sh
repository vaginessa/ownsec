#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/aanarchyy/bully
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy/bully
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
       
INSTALL
${normal}"

#plh11

GITCLONEFUNC
GITSBMDLINIT

cd src
./configure
make -j 4
sudo make install
#333d
CPDESKTFL
