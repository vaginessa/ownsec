#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git clone https://github.com/vanhauser-thc/thc-hydra.git
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra
GITCLONEDIR=cd /opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL1=hydra-gtk.desktop
DSKTPFL2=hydra.desktop
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
              
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

cd $GITREPOROOT
make clean
GITSBMDLINIT

./configure
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
