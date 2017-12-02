#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/SpiderLabs/Responder.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/responder/SpiderLabs/Responder
GITCLONEDIR=/opt/ITSEC/7.Mitm/responder/SpiderLabs
EXECUTEABLE1=Responder.py
EXECUTEABLE2=responder
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=responder.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _____ ____  ____   ___  _   _ ____  _____ ____  
|  _ \| ____/ ___||  _ \ / _ \| \ | |  _ \| ____|  _ \ 
| |_) |  _| \___ \| |_) | | | |  \| | | | |  _| | |_) |
|  _ <| |___ ___) |  __/| |_| | |\  | |_| | |___|  _ < 
|_| \_\_____|____/|_|    \___/|_| \_|____/|_____|_| \_\
           
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
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

