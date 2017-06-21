#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus
cd /opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus
git clone https://github.com/jmk-foofus/medusa.git
#
sudo udpatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus/medusa
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=medusa.desktop

#
cd $GITREPOROOT
sudo rm -r $GITREPOROOT/deps
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
mkdir deps
cd deps
#
git clone https://github.com/simonvetter/afpfs-ng
cd afpfs-ng
sudo make uninstall 
make clean
git clean -f
git pull
./configure
make -j 2 
sudo make install 
cd ../..
#
#sudo make uninstall
make clean
./configure 
make -j 2 
sudo make install
#

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL





