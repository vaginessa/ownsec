#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/P0cL4bs/Thanos.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs/Thanos
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs
EXECUTEABLE1=thanos	
EXECUTEABLE2=thanos
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFL=thanos.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ _   _    _    _   _  ___  ____  
|_   _| | | |  / \  | \ | |/ _ \/ ___| 
  | | | |_| | / _ \ |  \| | | | \___ \ 
  | | |  _  |/ ___ \| |\  | |_| |___) |
  |_| |_| |_/_/   \_\_| \_|\___/|____/ 
        
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add
### DEPS END

#make clean
GITSBMDLINIT
make -j 4
#sudo make install

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

thanos --new-db banner_grabber.db
