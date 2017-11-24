#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/vanhauser-thc/thc-hydra.git
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL1=hydra-gtk.desktop
DSKTPFL2=hydra.desktop
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
 _____ _   _  ____      _   ___   ______  ____      _    
|_   _| | | |/ ___|    | | | \ \ / /  _ \|  _ \    / \   
  | | | |_| | |   _____| |_| |\ V /| | | | |_) |  / _ \  
  | | |  _  | |__|_____|  _  | | | | |_| |  _ <  / ___ \ 
  |_| |_| |_|\____|    |_| |_| |_| |____/|_| \_\/_/   \_\
              
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

./configure
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
