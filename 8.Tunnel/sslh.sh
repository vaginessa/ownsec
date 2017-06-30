#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _     _   _ 
/ ___/ ___|| |   | | | |
\___ \___ \| |   | |_| |
 ___) |__) | |___|  _  |
|____/____/|_____|_| |_|
            
${normal}"


mkdir -p /opt/ITSEC/8.Tunnel/sslh/yrutschle
cd /opt/ITSEC/8.Tunnel/sslh/yrutschle
git clone https://github.com/yrutschle/sslh.git

sudo updatedb
sudo ldconfig
GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=sslh.desktop

cd $GITREPOROOT

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

