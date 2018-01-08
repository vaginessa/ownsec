#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/BlackArch/0trace.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch
EXECUTEABLE1=0trace.py
EXECUTEABLE2=0trace
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFL=0trace.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

### DEPS:
sudo -H pip2 install pydnet
sudo -H pip2 install dpkt
sudo updatedb
sudo ldconfig
### DEPS END

echo "${bold}
  ___ _____ ____      _    ____ _____ 
 / _ \_   _|  _ \    / \  / ___| ____|
| | | || | | |_) |  / _ \| |   |  _|  
| |_| || | |  _ <  / ___ \ |___| |___ 
 \___/ |_| |_| \_\/_/   \_\____|_____|
             
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

GITSBMDLINIT

chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST  
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


