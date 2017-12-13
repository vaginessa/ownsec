#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/izderadicka/ptunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka
BINDIRLCL=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel/src
EXECUTEABLE1=ptunnel.py
EXECUTEABLE2=ptunnel
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=ptunnel.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ _____ _   _ _   _ _   _ _____ _     
|  _ \_   _| | | | \ | | \ | | ____| |    
| |_) || | | | | |  \| |  \| |  _| | |    
|  __/ | | | |_| | |\  | |\  | |___| |___ 
|_|    |_|  \___/|_| \_|_| \_|_____|_____|
           
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
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
cd $BINDIRLCL
sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $EXECUTEABLE1 
sudo ln -s $BINDIRLCL/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
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

