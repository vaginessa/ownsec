#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/opsdisk/metagoofil.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk/metagoofil
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk
EXECUTEABLE1=metagoofil.py
EXECUTEABLE2=metagoofil
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=metagoofil.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 __  __ _____ _____  _    ____  ___   ___  _____ ___ _     
|  \/  | ____|_   _|/ \  / ___|/ _ \ / _ \|  ___|_ _| |    
| |\/| |  _|   | | / _ \| |  _| | | | | | | |_   | || |    
| |  | | |___  | |/ ___ \ |_| | |_| | |_| |  _|  | || |___ 
|_|  |_|_____| |_/_/   \_\____|\___/ \___/|_|   |___|_____|
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

### DEPS:
sudo -H pip2 install google
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST  
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
