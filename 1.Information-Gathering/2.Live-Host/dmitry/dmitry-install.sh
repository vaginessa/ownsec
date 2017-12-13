#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/jaygreig86/dmitry.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86
EXECUTEABLE1=dmitry
EXECUTEABLE2=dmitry
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=dmitry.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  __  __ ___ _____ ______   __
|  _ \|  \/  |_ _|_   _|  _ \ \ / /
| | | | |\/| || |  | | | |_) \ V / 
| |_| | |  | || |  | | |  _ < | |  
|____/|_|  |_|___| |_| |_| \_\|_|  
           
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
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

chmod +x configure
chmod +x bootstrap
./bootstrap
./configure
make -j 4

sudo rm $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
