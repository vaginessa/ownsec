#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/orgcandman/simple-fuzzer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman/simple-fuzzer
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman/simple-fuzzer/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman
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
 ____ ___ __  __ ____  _     _____ _____ _   _ _______________ ____  
/ ___|_ _|  \/  |  _ \| |   | ____|  ___| | | |__  /__  / ____|  _ \ 
\___ \| || |\/| | |_) | |   |  _| | |_  | | | | / /  / /|  _| | |_) |
 ___) | || |  | |  __/| |___| |___|  _| | |_| |/ /_ / /_| |___|  _ < 
|____/___|_|  |_|_|   |_____|_____|_|    \___//____/____|_____|_| \_\
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
./configure
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
