#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/sleuthkit/sleuthkit
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit
GITCLONEDIR=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=dnschef.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _     _____ _   _ _____ _   _ _  _____ _____ 
/ ___|| |   | ____| | | |_   _| | | | |/ /_ _|_   _|
\___ \| |   |  _| | | | | | | | |_| | ' / | |  | |  
 ___) | |___| |___| |_| | | | |  _  | . \ | |  | |  
|____/|_____|_____|\___/  |_| |_| |_|_|\_\___| |_|  
          
INSTALL
${normal}"

cd $GITREPOROOT

### DEPS:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libewf-dev libafflib-dev
sudo udpatedb
### DEPS END

GITSBMDLINIT
./bootstrap 
./configure
make -j 4
sudo make install
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4