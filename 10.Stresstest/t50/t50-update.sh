#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/fredericopissarra/t50
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50 
GITCONFDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=t50.desktop
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
 _____ ____   ___  
|_   _| ___| / _ \ 
  | | |___ \| | | |
  | |  ___) | |_| |
  |_| |____/ \___/ 
             
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
GITRESET
GITSBMDLINIT
./configure
make -j 4
sudo make install

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


