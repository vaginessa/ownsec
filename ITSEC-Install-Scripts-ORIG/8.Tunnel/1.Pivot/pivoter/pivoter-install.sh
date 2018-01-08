#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/trustedsec/pivoter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/pivoter
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot/pivoter
DSKTPFL=pivoter.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/pivoter
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ _____     _____ _____ _____ ____  
|  _ \_ _\ \   / / _ \_   _| ____|  _ \ 
| |_) | | \ \ / / | | || | |  _| | |_) |
|  __/| |  \ V /| |_| || | | |___|  _ < 
|_|  |___|  \_/  \___/ |_| |_____|_| \_\
                
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