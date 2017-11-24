#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/grwl/sslcaudit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl/sslcaudit
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl/sslcaudit/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFL=sslcaudit.desktop
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
 ____ ____  _     ____    _   _   _ ____ ___ _____ 
/ ___/ ___|| |   / ___|  / \ | | | |  _ \_ _|_   _|
\___ \___ \| |  | |     / _ \| | | | | | | |  | |  
 ___) |__) | |__| |___ / ___ \ |_| | |_| | |  | |  
|____/____/|_____\____/_/   \_\___/|____/___| |_|  
              
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

sudo -H pip2 install M2Crypto
sudo udpatedb
sudo ldconfig

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
