#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/1N3/BruteX
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brutex/1N3
EXECUTEABLE1=brutex
EXECUTEABLE2=brutex
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brutex
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/brutex
DSKTPFL=brutex.desktop
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
 ____  ____  _   _ _____ _______  __
| __ )|  _ \| | | |_   _| ____\ \/ /
|  _ \| |_) | | | | | | |  _|  \  / 
| |_) |  _ <| |_| | | | | |___ /  \ 
|____/|_| \_\\___/  |_| |_____/_/\_\
      
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

sed -i 's#/usr/share/brutex#/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX#g' brutex

cd $GITREPOROOT
mkdir loot

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

