#!/bin/bash 

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/simsong/tcpflow.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/tcpflow/simsong/tcpflow
GITCLONEDIR=/opt/ITSEC/7.Mitm/tcpflow/simsong
EXECUTEABLE1=tcpflow
EXECUTEABLE2=tcpflow
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=tcpflow.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ____ ____  _____ _     _____        __
|_   _/ ___|  _ \|  ___| |   / _ \ \      / /
  | || |   | |_) | |_  | |  | | | \ \ /\ / / 
  | || |___|  __/|  _| | |__| |_| |\ V  V /  
  |_| \____|_|   |_|   |_____\___/  \_/\_/   
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
make clean
sudo make uninstall

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
./bootstrap.bash
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
