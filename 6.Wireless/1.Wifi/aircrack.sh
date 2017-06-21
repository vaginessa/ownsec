#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng
cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng
git clone https://github.com/aircrack-ng/aircrack-ng

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng/aircrack-ng

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=aircrack-ng.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
make -j 4
sudo make install
sudo airodump-ng-oui-update
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

