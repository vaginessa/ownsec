#!/bin/bash 

bold=$(tput bold)
normal=$(tput sgr0)

GITREPOROOT=/opt/ITSEC/7.Mitm/tcpflow/simsong/tcpflow
EXECUTEABLE1=tcpflow
EXECUTEABLE2=tcpflow
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=tcpflow.desktop

echo "${bold}
 _____ ____ ____  _____ _     _____        __
|_   _/ ___|  _ \|  ___| |   / _ \ \      / /
  | || |   | |_) | |_  | |  | | | \ \ /\ / / 
  | || |___|  __/|  _| | |__| |_| |\ V  V /  
  |_| \____|_|   |_|   |_____\___/  \_/\_/   
         
${normal}"

mkdir -p /opt/ITSEC/7.Mitm/tcpflow/simsong
cd /opt/ITSEC/7.Mitm/tcpflow/simsong
git clone https://github.com/simsong/tcpflow.git

sudo updatedb
sudo ldconfig

cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
./bootstrap.bash
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
