#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/astroza/udptunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel
GITCLONEDIR=/opt/ITSEC/8.Tunnel/udptunnel/astroza
EXECUTEABLE1=client
EXECUTEABLE2=udptunnel
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=udptunnel.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ ____  ____ _____ _   _ _   _ _   _ _____ _     
| | | |  _ \|  _ \_   _| | | | \ | | \ | | ____| |    
| | | | | | | |_) || | | | | |  \| |  \| |  _| | |    
| |_| | |_| |  __/ | | | |_| | |\  | |\  | |___| |___ 
 \___/|____/|_|    |_|  \___/|_| \_|_| \_|_____|_____|
          
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

sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL