#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/2.Local/ophcrack/luisgg
cd /opt/ITSEC/4.Password/2.Local/ophcrack/luisgg
git clone https://github.com/luisgg/ophcrack.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/ophcrack/luisgg/ophcrack
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=ophcrack.desktop

#
cd $GITREPOROOT
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL