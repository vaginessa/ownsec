#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/1aN0rmus/TekDefense-Automater.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus/TekDefense-Automater
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus
EXECUTEABLE1=Automater.py
EXECUTEABLE2=automater
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=automater.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _   _   _ _____ ___  __  __    _  _____ _____ ____  
   / \ | | | |_   _/ _ \|  \/  |  / \|_   _| ____|  _ \ 
  / _ \| | | | | || | | | |\/| | / _ \ | | |  _| | |_) |
 / ___ \ |_| | | || |_| | |  | |/ ___ \| | | |___|  _ < 
/_/   \_\___/  |_| \___/|_|  |_/_/   \_\_| |_____|_| \_\
INSTALL  
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL