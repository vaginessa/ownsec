#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git://git.kali.org/packages/wol-e.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie/wol-e
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
EXECUTEABLE1=wol-e.py
EXECUTEABLE2=wol-e
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=wol-e.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
__        _____  _          _____ 
\ \      / / _ \| |        | ____|
 \ \ /\ / / | | | |   _____|  _|  
  \ V  V /| |_| | |__|_____| |___ 
   \_/\_/  \___/|_____|    |_____|
            
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

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

#foreman s