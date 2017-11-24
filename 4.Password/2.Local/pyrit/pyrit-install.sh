#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/JPaulMora/Pyrit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=pyrit.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ______   ______  ___ _____ 
|  _ \ \ / /  _ \|_ _|_   _|
| |_) \ V /| |_) || |  | |  
|  __/ | | |  _ < | |  | |  
|_|    |_| |_| \_\___| |_|  
            
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT

sudo python setup.py install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL