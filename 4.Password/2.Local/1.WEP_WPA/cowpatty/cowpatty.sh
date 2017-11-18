#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/roobixx/cowpatty.git
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
EXECUTEABLE1=cowpatty
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local/1.WEP_WPA
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/1.WEP_WPA
DSKTPFL=cowpatty.desktop
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
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

cd $GITREPOROOT
make clean
GITSBMDLINIT

make -j 4
sudo chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE1

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL