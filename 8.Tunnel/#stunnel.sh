#!/bin/bash


mkdir -p /opt/ITSEC/8.Tunnel/stunnel/airtrack
cd /opt/ITSEC/8.Tunnel/stunnel/airtrack
git clone https://github.com/airtrack/stunnel.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=stunnel.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
cargo build -v --release
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL