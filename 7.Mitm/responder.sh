#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/responder/SpiderLabs
cd /opt/ITSEC/7.Mitm/responder/SpiderLabs
git clone https://github.com/SpiderLabs/Responder.git



GITREPOROOT=/opt/ITSEC/7.Mitm/responder/SpiderLabs/Responder
EXECUTEABLE1=Responder.py

EXECUTEABLE2=responder
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=responder.desktop

#
cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2

sudo updatedb
sudo ldconfig
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

