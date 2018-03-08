#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/aircrack-ng/aircrack-ng
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng/aircrack-ng
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng/aircrack-ng/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack-ng
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/aircrack-ng
DSKTPFL=aircrack-ng.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack-ng
#ph1a

echo "${bold}
    _    ___ ____   ____ ____      _    ____ _  __     _   _  ____ 
   / \  |_ _|  _ \ / ___|  _ \    / \  / ___| |/ /    | \ | |/ ___|
  / _ \  | || |_) | |   | |_) |  / _ \| |   | ' /_____|  \| | |  _ 
 / ___ \ | ||  _ <| |___|  _ <  / ___ \ |___| . \_____| |\  | |_| |
/_/   \_\___|_| \_\\____|_| \_\/_/   \_\____|_|\_\    |_| \_|\____|
         
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
env NOCONFIGURE=1 ./autogen.sh
./configure
make -j 4
sudo make install
sudo airodump-ng-oui-update
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

