#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen
cd /opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen
git clone https://github.com/routerkeygen/routerkeygenPC.git

sudo updatedb
sudo ldconfig
#
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC

#
cd $GITREPOROOT
sudo rm -r build
mkdir build
cd build
sudo make uninstall
make clean
cd ..
git clean -f
git fetch origin
git reset --hard origin/master
git pull
#git submodule init && git submodule update --recursive
cd build
cmake ..
make -j 4
sudo make install
