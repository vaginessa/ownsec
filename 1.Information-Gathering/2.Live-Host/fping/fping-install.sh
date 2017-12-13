#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/schweikert/fping.git
BRANCH=develop
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=fping.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ____ ___ _   _  ____ 
|  ___|  _ \_ _| \ | |/ ___|
| |_  | |_) | ||  \| | |  _ 
|  _| |  __/| || |\  | |_| |
|_|   |_|  |___|_| \_|\____|
         
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

./autogen.sh
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
