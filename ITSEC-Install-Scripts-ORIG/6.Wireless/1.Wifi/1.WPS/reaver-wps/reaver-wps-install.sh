#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/t6x/reaver-wps-fork-t6x.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x
REPOBUILDDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x/src
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/1.WPS/reaver-wps
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x
DSKTPFL=reaver-wps-fork-t6x.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x
#ph1a

echo "${bold}
 ____  _____    ___     _______ ____  
|  _ \| ____|  / \ \   / / ____|  _ \ 
| |_) |  _|   / _ \ \ / /|  _| | |_) |
|  _ <| |___ / ___ \ V / | |___|  _ < 
|_| \_\_____/_/   \_\_/  |_____|_| \_\
            
INSTALL
${normal}"

#plh11

GITCLONEFUNC
make clean
GITSBMDLINIT

cd $REPOBUILDDIR
./configure
make -j 4
sudo make install
#333d
CPDESKTFL
