#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchy
cd /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchy
git clone https://github.com/aanarchy/bully.git

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchy/bully
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=bully.desktop

#
cd $GITREPOROOT

sudo updatedb
sudo ldconfig

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
cd src
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
