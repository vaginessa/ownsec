#!/bin/bash

## functions
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/aircrack-ng/aircrack-ng
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng/aircrack-ng
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=aircrack-ng.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
## functions end
## banner
echo "${bold}
    _    ___ ____   ____ ____      _    ____ _  __     _   _  ____ 
   / \  |_ _|  _ \ / ___|  _ \    / \  / ___| |/ /    | \ | |/ ___|
  / _ \  | || |_) | |   | |_) |  / _ \| |   | ' /_____|  \| | |  _ 
 / ___ \ | ||  _ <| |___|  _ <  / ___ \ |___| . \_____| |\  | |_| |
/_/   \_\___|_| \_\\____|_| \_\/_/   \_\____|_|\_\    |_| \_|\____|
         
INSTALL
${normal}"
## banner end

## clone 
mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
## end clone 

### DEPS:
## Installed w apt lists - see /opt/ownsec/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-aircrack-ng.txt") -r -- sudo apt-get install -y
### DEPS END

## clean and init
make clean
GITSBMDLINIT
## end clean and init

## Install routine start 
make -j 4
sudo make install
sudo airodump-ng-oui-update

## install routine end

## symlink & cp desktop files
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

