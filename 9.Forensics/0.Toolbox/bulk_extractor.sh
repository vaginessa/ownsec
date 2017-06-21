#!/bin/bash

GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong/bulk_extractor
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=bulk-extractor.desktop

#
cd $GITREPOROOT
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
chmod +x bootstrap.sh
./bootstrap.sh
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL