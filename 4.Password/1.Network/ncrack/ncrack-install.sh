#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/nmap/ncrack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/ncrack/nmap
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=ncrack.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 _   _  ____ ____      _    ____ _  __
| \ | |/ ___|  _ \    / \  / ___| |/ /
|  \| | |   | |_) |  / _ \| |   | ' / 
| |\  | |___|  _ <  / ___ \ |___| . \ 
|_| \_|\____|_| \_\/_/   \_\____|_|\_\
          
/nmap/ncrack
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-ncrack.txt") -r -- sudo apt-get install -y
# sudo updatedb
# sudo ldconfig

GITSBMDLINIT

./configure
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
