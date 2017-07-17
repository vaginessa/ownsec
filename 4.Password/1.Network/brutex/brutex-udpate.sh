#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  _   _ _____ _______  __
| __ )|  _ \| | | |_   _| ____\ \/ /
|  _ \| |_) | | | | | | |  _|  \  / 
| |_) |  _ <| |_| | | | | |___ /  \ 
|____/|_| \_\\___/  |_| |_____/_/\_\
      
${normal}"

mkdir -p /opt/ITSEC/4.Password/1.Network/brutex/1N3
cd /opt/ITSEC/4.Password/1.Network/brutex/1N3
git clone https://github.com/1N3/BruteX

cd /opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX
sed -i 's#/usr/share/brutex#/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX#g' brutex

BRUTEX_INSTALL_DIR=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX

cd $BRUTEX_INSTALL_DIR

git clean -f
git fetch origin
git reset --hard origin/master
git pull

git submodule init
git submodule update --recursive

mkdir loot
chmod +x $BRUTEX_INSTALL_DIR/brutex
sudo rm -f /usr/local/bin/brutex
sudo ln -s $BRUTEX_INSTALL_DIR/brutex /usr/local/bin/brutex


