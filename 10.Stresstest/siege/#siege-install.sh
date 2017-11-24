#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/JoeDog/siege
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege
GITCLONEDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog
EXECUTEABLE1=siege
EXECUTEABLE2=siege
BINDIR=/usr/local/bin
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____ ___ _____ ____ _____ 
/ ___|_ _| ____/ ___| ____|
\___ \| ||  _|| |  _|  _|  
 ___) | || |__| |_| | |___ 
|____/___|_____\____|_____|
          
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
