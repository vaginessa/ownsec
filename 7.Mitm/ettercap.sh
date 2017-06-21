#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/ettercap/Ettercap
cd /opt/ITSEC/7.Mitm/ettercap/Ettercap
git clone https://github.com/Ettercap/ettercap.git

GITREPOROOT=/opt/ITSEC/7.Mitm/ettercap/Ettercap/ettercap
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=ettercap.desktop

sudo updatdb
sudo ldconfig
cd $GITREPOROOT
cd build
sudo make uninstall
cd ..
sudo rm -r build
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

mkdir build
cd build
cmake ../
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL