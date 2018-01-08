#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/samyk/pwnat.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/pwnat/samyk/pwnat
GITCLONEDIR=/opt/ITSEC/8.Tunnel/pwnat/samyk
EXECUTEABLE1=pwnat	
EXECUTEABLE2=pwnat
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=pwnat.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ______        ___   _    _  _____ 
|  _ \ \      / / \ | |  / \|_   _|
| |_) \ \ /\ / /|  \| | / _ \ | |  
|  __/ \ V  V / | |\  |/ ___ \| |  
|_|     \_/\_/  |_| \_/_/   \_\_|  
             
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

#sudo make install doesent work
#
sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL