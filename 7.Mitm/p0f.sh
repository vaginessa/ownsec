#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/p0f/p0f
cd /opt/ITSEC/7.Mitm/p0f/p0f
git clone https://github.com/p0f/p0f.git


GITREPOROOT=/opt/ITSEC/7.Mitm/p0f/p0f/p0f
EXECUTEABLE1=p0f
EXECUTEABLE2=p0f
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=p0f.desktop


sudo updatedb
sudo ldconfig

cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
make -j 4
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL