#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/JPaulMora/Pyrit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pyrit
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/pyrit
DSKTPFL=pyrit.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pyrit
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ______   ______  ___ _____ 
|  _ \ \ / /  _ \|_ _|_   _|
| |_) \ V /| |_) || |  | |  
|  __/ | | |  _ < | |  | |  
|_|    |_| |_| \_\___| |_|  
            
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
