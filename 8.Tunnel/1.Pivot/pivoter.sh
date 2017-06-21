#!/bin/bash


mkdir -p /opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
cd /opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
git clone https://github.com/trustedsec/pivoter.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter/
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=pivoter.desktop

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
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL