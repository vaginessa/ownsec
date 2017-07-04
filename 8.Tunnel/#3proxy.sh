#!/bin/bash

# make didnt work
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ____  ____   _____  ____   __
|___ /|  _ \|  _ \ / _ \ \/ /\ \ / /
  |_ \| |_) | |_) | | | \  /  \ V / 
 ___) |  __/|  _ <| |_| /  \   | |  
|____/|_|   |_| \_\\___/_/\_\  |_|  
                   
${normal}"

mkdir -p /opt/ITSEC/8.Tunnel/3proxy/z3APA3A
cd /opt/ITSEC/8.Tunnel/3proxy/z3APA3A
git clone https://github.com/z3APA3A/3proxy.git

GITREPOROOT=/opt/ITSEC/8.Tunnel/3proxy/z3APA3A/3proxy
EXECUTEABLE1=3proxy	
EXECUTEABLE2=3proxy

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=3proxy.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#


#sudo make install doesent work
#
sudo rm -f /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL