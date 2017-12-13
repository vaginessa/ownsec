#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/droe/sslsplit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/sslsplit/droe/sslsplit
GITCLONEDIR=/opt/ITSEC/7.Mitm/sslsplit/droe
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sslsplit.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ____  _     ____  ____  _     ___ _____ 
/ ___/ ___|| |   / ___||  _ \| |   |_ _|_   _|
\___ \___ \| |   \___ \| |_) | |    | |  | |  
 ___) |__) | |___ ___) |  __/| |___ | |  | |  
|____/____/|_____|____/|_|   |_____|___| |_|  
             
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
make clean
sudo make uninstall

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
make -j 4
sudo make install

rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL