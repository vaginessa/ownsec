#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPOROOT=/opt/ITSEC/7.Mitm/sniffjoke/vecna/sniffjoke
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sniffjoke.desktop
echo "${bold}
 ____  _   _ ___ _____ _____   _  ___  _  _______ 
/ ___|| \ | |_ _|  ___|  ___| | |/ _ \| |/ / ____|
\___ \|  \| || || |_  | |_ _  | | | | | ' /|  _|  
 ___) | |\  || ||  _| |  _| |_| | |_| | . \| |___ 
|____/|_| \_|___|_|   |_|  \___/ \___/|_|\_\_____|
         
${normal}"


mkdir -p /opt/ITSEC/7.Mitm/sniffjoke/vecna
cd /opt/ITSEC/7.Mitm/sniffjoke/vecna
git clone https://github.com/vecna/sniffjoke.git


cd $GITREPOROOT

sudo updatedb
sudo ldconfig
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