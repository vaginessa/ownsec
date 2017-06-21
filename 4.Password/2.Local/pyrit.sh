#!/bin/bash


mkdir -p /opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora
cd /opt/ITSEC/4.Password/pyrit/2.Local/JPaulMora
git clone https://github.com/JPaulMora/Pyrit.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=pyrit.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
sudo python setup.py install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL