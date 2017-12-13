#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/MisterBianco/BoopSuite
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=boopsniff_gui.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____                   ____        _ _       
| __ )  ___   ___  _ __/ ___| _   _(_) |_ ___ 
|  _ \ / _ \ / _ \| '_ \___ \| | | | | __/ _ \
| |_) | (_) | (_) | |_) |__) | |_| | | ||  __/
|____/ \___/ \___/| .__/____/ \__,_|_|\__\___|
                  |_|        
INSTALL            
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo python install.py

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
