#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/t6x/reaver-wps-fork-t6x.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x
REPOBUILDDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x/src
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=reaver.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _____    ___     _______ ____  
|  _ \| ____|  / \ \   / / ____|  _ \ 
| |_) |  _|   / _ \ \ / /|  _| | |_) |
|  _ <| |___ / ___ \ V / | |___|  _ < 
|_| \_\_____/_/   \_\_/  |_____|_| \_\
            
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT
make clean
GITSBMDLINIT

cd $REPOBUILDDIR
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
