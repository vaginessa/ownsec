#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k
cd /opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k
git clone https://github.com/g0tmi1k/exe2hex.git

sudo updatedb
sudo ldconfig
#
GITREPOROOT=/opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k/exe2hex
EXECUTEABLE1=exe2hex.py
EXECUTEABLE2=exe2hex

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=exe2hex.desktop

#
cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive


#
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

