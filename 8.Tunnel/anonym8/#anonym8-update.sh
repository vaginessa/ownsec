#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    _   _  ___  _   ___   ____  __  ___  
   / \  | \ | |/ _ \| \ | \ \ / /  \/  |( _ ) 
  / _ \ |  \| | | | |  \| |\ V /| |\/| |/ _ \ 
 / ___ \| |\  | |_| | |\  | | | | |  | | (_) |
/_/   \_\_| \_|\___/|_| \_| |_| |_|  |_|\___/ 
           
${normal}"

mkdir -p /opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise
cd /opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise
git clone https://github.com/HiroshiManRise/anonym8

GITREPOROOT=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8
GITREPOGITFILE=$GITREPOROOT/.git

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
#
chmod +x ./INSTALL.sh
#sudo ./INSTALL.sh