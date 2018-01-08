#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/sleuthkit/sleuthkit
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit
GITCONFDIR=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit/.git
GITCLONEDIR=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=dnschef.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _     _____ _   _ _____ _   _ _  _____ _____ 
/ ___|| |   | ____| | | |_   _| | | | |/ /_ _|_   _|
\___ \| |   |  _| | | | | | | | |_| | ' / | |  | |  
 ___) | |___| |___| |_| | | | |  _  | . \ | |  | |  
|____/|_____|_____|\___/  |_| |_| |_|_|\_\___| |_|  
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

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libewf-dev libafflib-dev
sudo udpatedb
sudo ldconfig


cd $GITREPOROOT
sudo make uninstall
GITRESET
GITSBMDLINIT
./bootstrap 
./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
rm -f $DSKTPFLSDEST/$DSKTPFL3
rm -f $DSKTPFLSDEST/$DSKTPFL4
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi