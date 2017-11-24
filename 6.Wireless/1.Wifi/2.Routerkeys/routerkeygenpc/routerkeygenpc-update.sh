#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/routerkeygen/routerkeygenPC.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ _____ ____  _  _________   ______ _____ _   _ ____   ____ 
|  _ \_   _|  _ \| |/ / ____\ \ / / ___| ____| \ | |  _ \ / ___|
| |_) || | | |_) | ' /|  _|  \ V / |  _|  _| |  \| | |_) | |    
|  _ < | | |  _ <| . \| |___  | || |_| | |___| |\  |  __/| |___ 
|_| \_\|_| |_| \_\_|\_\_____| |_| \____|_____|_| \_|_|    \____|
       
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT
sudo rm -r build
mkdir build
cd build
sudo make uninstall
make clean
cd ..
GITRESET
#GITSBMDLINIT
cd build
cmake ..
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


