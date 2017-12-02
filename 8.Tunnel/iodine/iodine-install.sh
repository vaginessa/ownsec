#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/yarrick/iodine.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine
GITCONFDIR=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=iodine.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ___ ___  ____ ___ _   _ _____ 
|_ _/ _ \|  _ \_ _| \ | | ____|
 | | | | | | | | ||  \| |  _|  
 | | |_| | |_| | || |\  | |___ 
|___\___/|____/___|_| \_|_____|
              
INSTALL 
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL