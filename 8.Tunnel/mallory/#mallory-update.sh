#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/justmao945/mallory.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory
GITCONFDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945
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
 __  __    _    _     _     ___  ______   __
|  \/  |  / \  | |   | |   / _ \|  _ \ \ / /
| |\/| | / _ \ | |   | |  | | | | |_) \ V / 
| |  | |/ ___ \| |___| |__| |_| |  _ < | |  
|_|  |_/_/   \_\_____|_____\___/|_| \_\|_|  
          
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
#
#nothing todo here

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

