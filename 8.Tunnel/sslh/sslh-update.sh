#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/yrutschle/sslh.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
GITCONFDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=sslh.desktop
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
 ____ ____  _     _   _ 
/ ___/ ___|| |   | | | |
\___ \___ \| |   | |_| |
 ___) |__) | |___|  _  |
|____/____/|_____|_| |_|
            
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

