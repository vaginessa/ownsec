#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/aircrack-ng/aircrack-ng
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng/aircrack-ng
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=aircrack-ng.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    ___ ____   ____ ____      _    ____ _  __     _   _  ____ 
   / \  |_ _|  _ \ / ___|  _ \    / \  / ___| |/ /    | \ | |/ ___|
  / _ \  | || |_) | |   | |_) |  / _ \| |   | ' /_____|  \| | |  _ 
 / ___ \ | ||  _ <| |___|  _ <  / ___ \ |___| . \_____| |\  | |_| |
/_/   \_\___|_| \_\\____|_| \_\/_/   \_\____|_|\_\    |_| \_|\____|
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
make clean
GITSBMDLINIT

make -j 4
sudo make install
sudo airodump-ng-oui-update
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

