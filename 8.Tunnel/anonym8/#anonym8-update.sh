#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/HiroshiManRise/anonym8
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8
GITCONFDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise
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
    _    _   _  ___  _   ___   ____  __  ___  
   / \  | \ | |/ _ \| \ | \ \ / /  \/  |( _ ) 
  / _ \ |  \| | | | |  \| |\ V /| |\/| |/ _ \ 
 / ___ \| |\  | |_| | |\  | | | | |  | | (_) |
/_/   \_\_| \_|\___/|_| \_| |_| |_|  |_|\___/ 
           
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
chmod +x ./INSTALL.sh
#sudo ./INSTALL.sh

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

