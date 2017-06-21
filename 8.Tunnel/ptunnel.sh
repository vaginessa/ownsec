#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/ptunnel/izderadicka
cd /opt/ITSEC/8.Tunnel/ptunnel/izderadicka
git clone https://github.com/izderadicka/ptunnel.sh

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel
BINDIR=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel/src

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=ptunnel.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

cd $BINDIR
sudo rm -f /usr/local/bin/ptunnel
chmod +x ptunnel.py
sudo ln -s $BINDIR/ptunnel.py /usr/local/bin/ptunnel
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL