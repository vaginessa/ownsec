#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/ThomasHabets/arping.git
BRANCH=arping-2.x
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets/arping
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=arping.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    ____  ____ ___ _   _  ____ 
   / \  |  _ \|  _ \_ _| \ | |/ ___|
  / _ \ | |_) | |_) | ||  \| | |  _ 
 / ___ \|  _ <|  __/| || |\  | |_| |
/_/   \_\_| \_\_|  |___|_| \_|\____|
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

make clean 
GITSBMDLINIT

./bootstrap.sh
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL