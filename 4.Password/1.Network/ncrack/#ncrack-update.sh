#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _  ____ ____      _    ____ _  __
| \ | |/ ___|  _ \    / \  / ___| |/ /
|  \| | |   | |_) |  / _ \| |   | ' / 
| |\  | |___|  _ <  / ___ \ |___| . \ 
|_| \_|\____|_| \_\/_/   \_\____|_|\_\
          
${normal}"

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack
GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/4.Password/1.Network/ncrack/nmap
cd /opt/ITSEC/4.Password/1.Network/ncrack/nmap
git clone https://github.com/nmap/ncrack.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
#
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

fi

