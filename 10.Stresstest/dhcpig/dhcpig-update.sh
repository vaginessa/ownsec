#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/kamorin/DHCPig
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig
GITCONFDIR=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/dhcpig/kamorin
EXECUTEABLE1=pig.py
EXECUTEABLE2=dhcPIG
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=dhcpig.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _  ____ ____ ___ ____ 
|  _ \| | | |/ ___|  _ \_ _/ ___|
| | | | |_| | |   | |_) | | |  _ 
| |_| |  _  | |___|  __/| | |_| |
|____/|_| |_|\____|_|  |___\____|
           
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
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

