#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/roobixx/cowpatty.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
EXECUTEABLE1=cowpatty
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/1.WEP_WPA/cowpatty
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/1.WEP_WPA/cowpatty
DSKTPFL=cowpatty.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
  ____ _____        ______   _  _____ _______   __
 / ___/ _ \ \      / /  _ \ / \|_   _|_   _\ \ / /
| |  | | | \ \ /\ / /| |_) / _ \ | |   | |  \ V / 
| |__| |_| |\ V  V / |  __/ ___ \| |   | |   | |  
 \____\___/  \_/\_/  |_| /_/   \_\_|   |_|   |_|  
         
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
sudo chmod +x $EXECUTEABLE1
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
