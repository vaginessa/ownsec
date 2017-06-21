#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/pwnat/samyk
cd /opt/ITSEC/8.Tunnel/pwnat/samyk
git clone https://github.com/samyk/pwnat.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/pwnat/samyk/pwnat
EXECUTEABLE1=pwnat	
EXECUTEABLE2=pwnat
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=pwnat.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
make -j 4

#sudo make install doesent work
#
sudo rm -f /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL