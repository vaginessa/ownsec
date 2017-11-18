#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git clone https://github.com/shinnok/johnny.git
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johnny/shinnok
EXECUTEABLE1=johnny
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=johnny.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
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
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
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


