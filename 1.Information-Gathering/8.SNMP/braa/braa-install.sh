#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/mteg/braa.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg
EXECUTEABLE1=braa
EXECUTEABLE2=braa
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/8.SNMP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/8.SNMP
DSKTPFL=braa.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____      _        _    
| __ )|  _ \    / \      / \   
|  _ \| |_) |  / _ \    / _ \  
| |_) |  _ <  / ___ \  / ___ \ 
|____/|_| \_\/_/   \_\/_/   \_\

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
make -j 4
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL