#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/BlackArch/thc-pptp-bruter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch/thc-pptp-bruter
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=thc-pptp-bruter.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ _   _  ____      ____  ____ _____ ____  
|_   _| | | |/ ___|    |  _ \|  _ \_   _|  _ \ 
  | | | |_| | |   _____| |_) | |_) || | | |_) |
  | | |  _  | |__|_____|  __/|  __/ | | |  __/ 
  |_| |_| |_|\____|    |_|   |_|    |_| |_|    
                                               
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
make clean
GITSBMDLINIT

./bootstrap
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL