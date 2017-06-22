#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/sslsplit/droe
cd /opt/ITSEC/7.Mitm/sslsplit/droe
git clone https://github.com/droe/sslsplit.git

GITREPOROOT=/opt/ITSEC/7.Mitm/sslsplit/droe/sslsplit
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sslsplit.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _     ____  ____  _     ___ _____ 
/ ___/ ___|| |   / ___||  _ \| |   |_ _|_   _|
\___ \___ \| |   \___ \| |_) | |    | |  | |  
 ___) |__) | |___ ___) |  __/| |___ | |  | |  
|____/____/|_____|____/|_|   |_____|___| |_|  
             
${normal}"


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