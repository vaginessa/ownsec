#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/astroza/udptunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/udptunnel/astroza
EXECUTEABLE1=client
EXECUTEABLE2=udptunnel
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/udptunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/udptunnel
DSKTPFL=udptunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/udptunnel
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
 _   _ ____  ____ _____ _   _ _   _ _   _ _____ _     
| | | |  _ \|  _ \_   _| | | | \ | | \ | | ____| |    
| | | | | | | |_) || | | | | |  \| |  \| |  _| | |    
| |_| | |_| |  __/ | | | |_| | |\  | |\  | |___| |___ 
 \___/|____/|_|    |_|  \___/|_| \_|_| \_|_____|_____|
          
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

make -j 4

sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $EXECUTEABLE1 
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

