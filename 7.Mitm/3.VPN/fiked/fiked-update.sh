#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ___ _  _______ ____  
|  ___|_ _| |/ / ____|  _ \ 
| |_   | || ' /|  _| | | | |
|  _|  | || . \| |___| |_| |
|_|   |___|_|\_\_____|____/ 
           
UPDATE
${normal}"

GITREPO=https://github.com/droe/fiked.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe/fiked
GITCONFDIR=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe/fiked/.git
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm/3.VPN
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/3.VPN
DSKTPFL=fiked.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT

sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

sudo rm -f makefile
cp GNUmakefile makefile
make -j 4
sudo make install
sudo rm -f $DSKTPFLSDEST/$DSKTPFL
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

