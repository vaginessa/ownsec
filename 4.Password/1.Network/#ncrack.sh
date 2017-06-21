#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/1.Network/ncrack/nmap
cd /opt/ITSEC/4.Password/1.Network/ncrack/nmap
git clone https://github.com/nmap/ncrack.git

sudo udpatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack
#
cd $GITREPOROOT
#
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive


