#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/HiroshiManRise/anonym8
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8
GITCONFDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    _   _  ___  _   ___   ____  __  ___  
   / \  | \ | |/ _ \| \ | \ \ / /  \/  |( _ ) 
  / _ \ |  \| | | | |  \| |\ V /| |\/| |/ _ \ 
 / ___ \| |\  | |_| | |\  | | | | |  | | (_) |
/_/   \_\_| \_|\___/|_| \_| |_| |_|  |_|\___/ 
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT
chmod +x ./INSTALL.sh
#sudo ./INSTALL.sh