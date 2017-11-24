#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/seifreed/dirb.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/15.Fuzzer/
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFL=dirb.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ___ ____  ____  
|  _ \_ _|  _ \| __ ) 
| | | | || |_) |  _ \ 
| |_| | ||  _ <| |_) |
|____/___|_| \_\____/ 
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

GITSBMDLINIT
./configure
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL