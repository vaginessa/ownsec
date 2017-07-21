#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _____ _____ ____ ___ ____   ____ _____     _______ ____  
| \ | | ____|_   _|  _ \_ _/ ___| / ___/ _ \ \   / / ____|  _ \ 
|  \| |  _|   | | | | | | |\___ \| |  | | | \ \ / /|  _| | |_) |
| |\  | |___  | | | |_| | | ___) | |__| |_| |\ V / | |___|  _ < 
|_| \_|_____| |_| |____/___|____/ \____\___/  \_/  |_____|_| \_\
        
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
git clone https://github.com/alexxy/netdiscover.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy/netdiscover
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=netdiscover.desktop

cd $GITREPOROOT
cd build && sudo make uninstall
cd $GITREPOROOT
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
rm -f 
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL