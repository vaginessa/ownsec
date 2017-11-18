#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPOROOT=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=proxytunnel.desktop

echo "${bold}
 ____  ____   _____  ____   _______ _   _ _   _ _   _ _____ _     
|  _ \|  _ \ / _ \ \/ /\ \ / /_   _| | | | \ | | \ | | ____| |    
| |_) | |_) | | | \  /  \ V /  | | | | | |  \| |  \| |  _| | |    
|  __/|  _ <| |_| /  \   | |   | | | |_| | |\  | |\  | |___| |___ 
|_|   |_| \_\\___/_/\_\  |_|   |_|  \___/|_| \_|_| \_|_____|_____|
          
${normal}"

mkdir -p /opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
cd /opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
git clone https://github.com/proxytunnel/proxytunnel


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