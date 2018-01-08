#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/aanarchyy/bully
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy/bully
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=bully.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ _     _  __   __
| __ )| | | | |   | | \ \ / /
|  _ \| | | | |   | |  \ V / 
| |_) | |_| | |___| |___| |  
|____/ \___/|_____|_____|_|  
       
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT
GITSBMDLINIT

cd src
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
