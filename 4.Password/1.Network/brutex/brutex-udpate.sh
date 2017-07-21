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

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX
GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/4.Password/1.Network/brutex/1N3
cd /opt/ITSEC/4.Password/1.Network/brutex/1N3
git clone https://github.com/1N3/BruteX

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd /opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX
sed -i 's#/usr/share/brutex#/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX#g' brutex


cd $GITREPOROOT

git clean -f
git fetch origin
git reset --hard origin/master
git pull

git submodule init
git submodule update --recursive

mkdir loot
chmod +x $GITREPOROOT/brutex
sudo rm -f /usr/local/bin/brutex
sudo ln -s $GITREPOROOT/brutex /usr/local/bin/brutex

fi

