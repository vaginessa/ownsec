#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libewf-dev libafflib-dev
sudo udpatedb
sudo ldconfig
#

GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=dnschef.desktop
1
2
3
4
#
cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
./bootstrap 
./configure
make -j 4
sudo make install
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4
