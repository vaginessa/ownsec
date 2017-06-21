#!/bin/bash


mkdir -p /opt/ITSEC/8.Tunnel/anony/8/HiroshiManRise
cd /opt/ITSEC/8.Tunnel/anony/8/HiroshiManRise
git clone https://github.com/HiroshiManRise/anony/8
#


sudo updatedb
sudo ldconfig
GITREPOROOT=/opt/ITSEC/8.Tunnel/anony/8/HiroshiManRise/anony/8
#
cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
#
chmod +x ./INSTALL.sh
#sudo ./INSTALL.sh