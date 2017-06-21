#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
git clone https://github.com/schweikert/fping.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=fping.desktop

cd $GITREPOROOT
#
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

./autigen.sh
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
