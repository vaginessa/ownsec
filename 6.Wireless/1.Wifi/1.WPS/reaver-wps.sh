#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
cd /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
git clone https://github.com/t6x/reaver-wps-fork-t6x.git

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x
REPOBUILDDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x/src

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=reaver.desktop

#
cd $GITREPOROOT
make clean

sudo updatedb
sudo ldconfig

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
cd $REPOBUILDDIR
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
