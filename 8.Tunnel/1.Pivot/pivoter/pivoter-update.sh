#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/trustedsec/pivoter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter
GITCONFDIR=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFL=pivoter.desktop
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
 ____ _____     _____ _____ _____ ____  
|  _ \_ _\ \   / / _ \_   _| ____|  _ \ 
| |_) | | \ \ / / | | || | |  _| | |_) |
|  __/| |  \ V /| |_| || | | |___|  _ < 
|_|  |___|  \_/  \___/ |_| |_____|_| \_\
              
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
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

make -j 4
sudo make install
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

