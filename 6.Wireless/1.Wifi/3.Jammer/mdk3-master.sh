#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony
cd /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony
git clone https://github.com/camerony/mdk3-master.git


GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony/mdk3-master
#cd /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/wi-fi-analyzer/mdk3-master/
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFL=mdk3-master.desktop

#
cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL