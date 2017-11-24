#bug https://unix.stackexchange.com/questions/219152/pkglibexecdir-is-not-a-legitimate-directory


#!/bin/bash
#
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/darconeous/miredo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo
GITCONFDIR=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/miredo/darconeous
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
 __  __ ___ ____  _____ ____   ___  
|  \/  |_ _|  _ \| ____|  _ \ / _ \ 
| |\/| || || |_) |  _| | | | | | | |
| |  | || ||  _ <| |___| |_| | |_| |
|_|  |_|___|_| \_\_____|____/ \___/ 
          
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
./autogen.sh

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

