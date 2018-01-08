#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/droe/fiked.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe/fiked
GITCLONEDIR=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/3.VPN/fiked
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/3.VPN/fiked
DSKTPFL=fiked.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/3.VPN/fiked
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ___ _  _______ ____  
|  ___|_ _| |/ / ____|  _ \ 
| |_   | || ' /|  _| | | | |
|  _|  | || . \| |___| |_| |
|_|   |___|_|\_\_____|____/ 
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-fiked.txt") -r -- sudo apt-get install -y
### DEPS END

sudo make uninstall
make clean
GITSBMDLINIT

sudo rm -f makefile
cp GNUmakefile makefile
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
