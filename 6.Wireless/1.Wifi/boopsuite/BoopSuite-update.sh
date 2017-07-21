#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____                   ____        _ _       
| __ )  ___   ___  _ __/ ___| _   _(_) |_ ___ 
|  _ \ / _ \ / _ \| '_ \___ \| | | | | __/ _ \
| |_) | (_) | (_) | |_) |__) | |_| | | ||  __/
|____/ \___/ \___/| .__/____/ \__,_|_|\__\___|
                  |_|                    
${normal}"

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco
cd /opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco
git clone https://github.com/MisterBianco/BoopSuite

sudo rm /usr/local/bin/boopsuite

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=boopsniff_gui.desktop

sudo rm -f /usr/local/bin/$EXECUTEABLE2

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
sudo -H pip2 install -r requirements.txt
#
sudo python install.py
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
