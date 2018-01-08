#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/jaygreig86/dmitry.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86
EXECUTEABLE1=dmitry
EXECUTEABLE2=dmitry
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=dmitry.desktop
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
 ____  __  __ ___ _____ ______   __
|  _ \|  \/  |_ _|_   _|  _ \ \ / /
| | | | |\/| || |  | | | |_) \ V / 
| |_| | |  | || |  | | |  _ < | |  
|____/|_|  |_|___| |_| |_| \_\|_|  
            
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

make clean
GITRESET
GITSBMDLINIT

chmod +x configure
chmod +x bootstrap
./bootstrap
./configure
make -j 4

sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
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
