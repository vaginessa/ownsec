#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/1N3/BruteX
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brutex/1N3
EXECUTEABLE1=brutex
EXECUTEABLE2=brutex
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=brutex.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____  _   _ _____ _______  __
| __ )|  _ \| | | |_   _| ____\ \/ /
|  _ \| |_) | | | | | | |  _|  \  / 
| |_) |  _ <| |_| | | | | |___ /  \ 
|____/|_| \_\\___/  |_| |_____/_/\_\
      
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

sed -i 's#/usr/share/brutex#/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX#g' brutex

cd $GITREPOROOT
mkdir loot

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

