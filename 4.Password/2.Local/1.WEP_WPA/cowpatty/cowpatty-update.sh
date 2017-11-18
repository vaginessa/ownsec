#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/roobixx/cowpatty.git
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
EXECUTEABLE1=cowpatty
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local/1.WEP_WPA/
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/1.WEP_WPA
DSKTPFL=cowpatty.desktop
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
