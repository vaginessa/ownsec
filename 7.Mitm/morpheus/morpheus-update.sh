#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/r00t-3xp10it/morpheus.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus
GITCONFDIR=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it
EXECUTEABLE1=morpheus.sh
EXECUTEABLE2=morpheus
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=morpheus.desktop
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
 __  __  ___  ____  ____  _   _ _____ _   _ ____  
|  \/  |/ _ \|  _ \|  _ \| | | | ____| | | / ___| 
| |\/| | | | | |_) | |_) | |_| |  _| | | | \___ \ 
| |  | | |_| |  _ <|  __/|  _  | |___| |_| |___) |
|_|  |_|\___/|_| \_\_|   |_| |_|_____|\___/|____/ 
              
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
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
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

