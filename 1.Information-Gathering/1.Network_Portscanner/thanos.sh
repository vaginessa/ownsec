#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs
git clone https://github.com/P0cL4bs/Thanos.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs/Thanos
EXECUTEABLE1=thanos	
EXECUTEABLE2=thanos

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=thanos.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _   _    _    _   _  ___  ____  
|_   _| | | |  / \  | \ | |/ _ \/ ___| 
  | | | |_| | / _ \ |  \| | | | \___ \ 
  | | |  _  |/ ___ \| |\  | |_| |___) |
  |_| |_| |_/_/   \_\_| \_|\___/|____/ 
        
${normal}"


cd $GITREPOROOT
#make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
#
make -j 4
#sudo make install

sudo rm /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

thanos --new-db banner_grabber.db
