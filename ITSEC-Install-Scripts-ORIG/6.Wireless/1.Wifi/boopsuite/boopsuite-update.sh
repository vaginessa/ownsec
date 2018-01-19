#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/MisterBianco/BoopSuite
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/boopsuite
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/boopsuite
DSKTPFL=boopsniff_gui.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/boopsuite
#ph1a
echo "${bold}
 ____                   ____        _ _       
| __ )  ___   ___  _ __/ ___| _   _(_) |_ ___ 
|  _ \ / _ \ / _ \| '_ \___ \| | | | | __/ _ \
| |_) | (_) | (_) | |_) |__) | |_| | | ||  __/
|____/ \___/ \___/| .__/____/ \__,_|_|\__\___|
                  |_|        
UPDATE            
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT

sudo -H pip2 install -r requirements.txt
sudo udpatedb
sudo ldconfig

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo python install.py


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



