#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/hardwaterhacker/URLCrazy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker/URLCrazy
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker
EXECUTEABLE1=urlcrazy
EXECUTEABLE2=urlcrazy
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=urlcrazy.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ ____  _     ____ ____      _     _______   __
| | | |  _ \| |   / ___|  _ \    / \   |__  /\ \ / /
| | | | |_) | |  | |   | |_) |  / _ \    / /  \ V / 
| |_| |  _ <| |__| |___|  _ <  / ___ \  / /_   | |  
 \___/|_| \_\_____\____|_| \_\/_/   \_\/____|  |_|  
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL