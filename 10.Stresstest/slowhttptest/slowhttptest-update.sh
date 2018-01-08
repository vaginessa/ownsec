#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/shekyan/slowhttptest
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/slowhttptest/shekyan/slowhttptest
GITCONFDIR=/opt/ITSEC/10.Stresstest/slowhttptest/shekyan/slowhttptest/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/slowhttptest/shekyan
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=slowhttptest.desktop
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
 ____  _     _____        ___   _ _____ _____ ____ _____ _____ ____ _____ 
/ ___|| |   / _ \ \      / / | | |_   _|_   _|  _ \_   _| ____/ ___|_   _|
\___ \| |  | | | \ \ /\ / /| |_| | | |   | | | |_) || | |  _| \___ \ | |  
 ___) | |__| |_| |\ V  V / |  _  | | |   | | |  __/ | | | |___ ___) || |  
|____/|_____\___/  \_/\_/  |_| |_| |_|   |_| |_|    |_| |_____|____/ |_|  
            
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


