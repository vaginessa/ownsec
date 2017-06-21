#!/bin/bash
#NOT WORKING
#

mkdir -p /opt/ITSEC/4.Password/1.Network/keimpx/inquisb
cd /opt/ITSEC/4.Password/1.Network/keimpx/inquisb
git clone https://github.com/inquisb/keimpx.git
#

sudo udpatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx
#
cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
sudo python3 setup.py install

