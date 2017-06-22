#!/bin/bash

#make not working

mkdir -p /opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A
cd /opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A
git clone https://github.com/z3APA3A/3proxy


#
sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A/3proxy


DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFL=3proxy.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ____  ____   _____  ____   __
|___ /|  _ \|  _ \ / _ \ \/ /\ \ / /
  |_ \| |_) | |_) | | | \  /  \ V / 
 ___) |  __/|  _ <| |_| /  \   | |  
|____/|_|   |_| \_\\___/_/\_\  |_|  
         
${normal}"

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
#

make -f makefile.unix
mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

