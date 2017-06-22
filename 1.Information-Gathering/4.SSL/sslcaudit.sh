#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl
cd /opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl
git clone https://github.com/grwl/sslcaudit.git


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl/sslcaudit
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFL=sslcaudit.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _        _   _   _ ____ ___ _____ 
/ ___/ ___|| |      / \ | | | |  _ \_ _|_   _|
\___ \___ \| |     / _ \| | | | | | | |  | |  
 ___) |__) | |___ / ___ \ |_| | |_| | |  | |  
|____/____/|_____/_/   \_\___/|____/___| |_|  
            
${normal}"

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull

git submodule init
git submodule update --recursive

sudo -H pip2 install M2Crypto

sudo python setup.py install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

