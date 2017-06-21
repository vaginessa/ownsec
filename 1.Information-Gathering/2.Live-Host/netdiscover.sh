#!/bin/sh

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
git clone https://github.com/alexxy/netdiscover.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy/netdiscover
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=netdiscover.desktop

cd $GITREPOROOT
cd build && make uninstall
cd $GITREPOROOT
sudo rm -r build
git clean -f
git fetch origin
git reset --hard origin/master

git pull
git submodule init
git submodule update --recursive
mkdir build
cd build
cmake ..
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL