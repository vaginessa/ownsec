#!/bin/bash


mkdir -p /opt/ITSEC/8.Tunnel/iodine/yarrick
cd /opt/ITSEC/8.Tunnel/iodine/yarrick
git clone https://github.com/yarrick/iodine.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=iodine.desktop

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