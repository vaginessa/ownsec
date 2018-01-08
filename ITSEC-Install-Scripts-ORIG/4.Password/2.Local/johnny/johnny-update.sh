#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/shinnok/johnny.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johnny/shinnok
EXECUTEABLE1=johnny
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/johnny
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/johnny
DSKTPFL=johnny.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/johnny
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
     _  ___  _   _ _   _ _   ___   __
    | |/ _ \| | | | \ | | \ | \ \ / /
 _  | | | | | |_| |  \| |  \| |\ V / 
| |_| | |_| |  _  | |\  | |\  | | |  
 \___/ \___/|_| |_|_| \_|_| \_| |_|  
       
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

export QT_SELECT=qt5
qmake
make -j$(nproc)

sudo rm -f $BINDIR/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE1
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


