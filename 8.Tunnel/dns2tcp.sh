#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/dns2tcp/risent
cd /opt/ITSEC/8.Tunnel/dns2tcp/risent
git clone https://github.com/risent/dns2tcp.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=dns2tcp.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
go build

chmod +x dns2tcp

sudo ln -s $GITREPOROOT/dns2tcp /usr/local/bin/dns2tcp


