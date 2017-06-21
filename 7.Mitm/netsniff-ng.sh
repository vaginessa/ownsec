#!/bin/bash


mkdir -p /opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng
cd /opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng
git clone https://github.com/netsniff-ng/netsniff-ng.git

GITREPOROOT=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng/netsniff-ng

sudo updatedb
sudo ldconfig
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=netsniff.desktop

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