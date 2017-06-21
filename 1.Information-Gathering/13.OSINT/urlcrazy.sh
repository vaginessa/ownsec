#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker
cd /opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker
git clone https://github.com/hardwaterhacker/URLCrazy.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker/URLCrazy
EXECUTEABLE1=urlcrazy
EXECUTEABLE2=urlcrazy
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=urlcrazy.desktop

#
cd $GITREPOROOT
sudo rm  /usr/local/bin/$EXECUTEABLE2
sudo updatedb
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL