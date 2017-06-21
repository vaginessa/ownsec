#!/bin/bash


mkdir -p /opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it
cd /opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it
git clone https://github.com/r00t-3xp10it/morpheus.git

GITREPOROOT=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus
sudo rm -f /usr/local/bin/morpheus
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=morpheus.desktop


sudo updatedb
sudo ldconfig
sudo rm -f /usr/local/bin/morpheus

cd /opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo ln -s /opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus/morpheus.sh /usr/local/bin/morpheus
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL