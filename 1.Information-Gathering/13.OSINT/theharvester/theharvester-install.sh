#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/laramies/theHarvester.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies/theHarvester
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies
EXECUTEABLE1=theHarvester.py
EXECUTEABLE2=theharvester
EXECUTEABLE3=myparser.py
EXECUTEABLE4=myparser
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=theharvester.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ _   _ _____ _   _    _    ______     _______ ____ _____ _____ ____  
|_   _| | | | ____| | | |  / \  |  _ \ \   / / ____/ ___|_   _| ____|  _ \ 
  | | | |_| |  _| | |_| | / _ \ | |_) \ \ / /|  _| \___ \ | | |  _| | |_) |
  | | |  _  | |___|  _  |/ ___ \|  _ < \ V / | |___ ___) || | | |___|  _ < 
  |_| |_| |_|_____|_| |_/_/   \_\_| \_\ \_/  |_____|____/ |_| |_____|_| \_\
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL