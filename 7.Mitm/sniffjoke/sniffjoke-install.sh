#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/vecna/sniffjoke.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/sniffjoke/vecna/sniffjoke
GITCLONEDIR=/opt/ITSEC/7.Mitm/sniffjoke/vecna
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sniffjoke.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ ___ _____ _____   _  ___  _  _______ 
/ ___|| \ | |_ _|  ___|  ___| | |/ _ \| |/ / ____|
\___ \|  \| || || |_  | |_ _  | | | | | ' /|  _|  
 ___) | |\  || ||  _| |  _| |_| | |_| | . \| |___ 
|____/|_| \_|___|_|   |_|  \___/ \___/|_|\_\_____|
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm -r build
GITSBMDLINIT
mkdir build
cd build
cmake ..
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL