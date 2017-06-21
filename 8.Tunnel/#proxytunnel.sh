#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
cd /opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
git clone https://github.com/proxytunnel/proxytunnel

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=proxytunnel.desktop

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