#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/wiire-a/pixiewps.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a/pixiewps
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS/
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=pixiewps.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____ _____  _____ _______        ______  ____  
|  _ \_ _\ \/ /_ _| ____\ \      / /  _ \/ ___| 
| |_) | | \  / | ||  _|  \ \ /\ / /| |_) \___ \ 
|  __/| | /  \ | || |___  \ V  V / |  __/ ___) |
|_|  |___/_/\_\___|_____|  \_/\_/  |_|   |____/ 
        
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
cd src
make clean
GITSBMDLINIT
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL