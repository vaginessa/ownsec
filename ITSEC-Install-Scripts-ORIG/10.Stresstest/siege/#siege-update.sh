#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/JoeDog/siege
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege
GITCONFDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog
EXECUTEABLE1=siege
EXECUTEABLE2=siege
BINDIR=/usr/local/bin
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
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
GITRESET
GITSBMDLINIT
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
