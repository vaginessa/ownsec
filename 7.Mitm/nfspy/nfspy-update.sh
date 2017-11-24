#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/bonsaiviking/NfSpy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy
GITCONFDIR=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=nfspy.desktop
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
 _   _ _____ ____  ______   __
| \ | |  ___/ ___||  _ \ \ / /
|  \| | |_  \___ \| |_) \ V / 
| |\  |  _|  ___) |  __/ | |  
|_| \_|_|   |____/|_|    |_|  
        
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
sudo python setup.py install

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

