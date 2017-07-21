#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ _____ ____ _____ 
/ ___|_ _| ____/ ___| ____|
\___ \| ||  _|| |  _|  _|  
 ___) | || |__| |_| | |___ 
|____/___|_____\____|_____|
          
${normal}"

GITREPOROOT=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=siege
EXECUTEABLE2=siege

if [ ! -d $GITREPOGITFILE ]

then


mkdir -p /opt/ITSEC/10.Stresstest/siege/JoeDog
cd /opt/ITSEC/10.Stresstest/siege/JoeDog
git clone https://github.com/JoeDog/siege

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f 
git pull
git submodule init 
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
fi