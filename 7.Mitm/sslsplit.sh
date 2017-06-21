#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/sslsplit/droe
cd /opt/ITSEC/7.Mitm/sslsplit/droe
git clone https://github.com/droe/sslsplit.git

GITREPOROOT=/opt/ITSEC/7.Mitm/sslsplit/droe/sslsplit
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sslsplit.desktop

cd $GITREPOROOT
sudo updatedb
sudo ldconfig
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL