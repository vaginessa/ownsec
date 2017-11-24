#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/xplico/xplico.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico/xplico
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
__  ______  _     ___ ____ ___  
\ \/ /  _ \| |   |_ _/ ___/ _ \ 
 \  /| |_) | |    | | |  | | | |
 /  \|  __/| |___ | | |__| |_| |
/_/\_\_|   |_____|___\____\___/ 
           
INSTALL 
${normal}"


mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

#installroutine

