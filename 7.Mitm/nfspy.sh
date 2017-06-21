#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/nfspy/bonsaiviking
cd /opt/ITSEC/7.Mitm/nfspy/bonsaiviking
git clone https://github.com/bonsaiviking/NfSpy.git

GITREPOROOT=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=nfspy.desktop

#
cd $GITREPOROOT

sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo python setup.py install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL