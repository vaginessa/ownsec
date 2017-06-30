#!/bin/bash
#NOT WORKING
#
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _  _______ ___ __  __ ______  __
| |/ / ____|_ _|  \/  |  _ \ \/ /
| ' /|  _|  | || |\/| | |_) \  / 
| . \| |___ | || |  | |  __//  \ 
|_|\_\_____|___|_|  |_|_|  /_/\_\
              
${normal}"

mkdir -p /opt/ITSEC/4.Password/1.Network/keimpx/inquisb
cd /opt/ITSEC/4.Password/1.Network/keimpx/inquisb
git clone https://github.com/inquisb/keimpx.git

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo python3 setup.py install

