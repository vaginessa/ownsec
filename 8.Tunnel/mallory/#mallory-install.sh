#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/justmao945/mallory.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory
GITCONFDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 __  __    _    _     _     ___  ______   __
|  \/  |  / \  | |   | |   / _ \|  _ \ \ / /
| |\/| | / _ \ | |   | |  | | | | |_) \ V / 
| |  | |/ ___ \| |___| |__| |_| |  _ < | |  
|_|  |_/_/   \_\_____|_____\___/|_| \_\|_|  
          
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT
#nothing todo here