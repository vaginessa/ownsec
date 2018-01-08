#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/robertswiecki/intrace.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki/intrace
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki
EXECUTEABLE1=intrace
EXECUTEABLE2=intrace
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFL=intrace.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

echo "${bold}
 ___ _   _ _____ ____      _    ____ _____ 
|_ _| \ | |_   _|  _ \    / \  / ___| ____|
 | ||  \| | | | | |_) |  / _ \| |   |  _|  
 | || |\  | | | |  _ <  / ___ \ |___| |___ 
|___|_| \_| |_| |_| \_\/_/   \_\____|_____|
               
INSTALL                                
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

make clean

GITSBMDLINIT
make -j 4
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
