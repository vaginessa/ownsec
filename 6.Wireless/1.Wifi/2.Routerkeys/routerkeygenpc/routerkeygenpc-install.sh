#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/routerkeygen/routerkeygenPC.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen/routerkeygenPC
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc/routerkeygen
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ _____ ____  _  _________   ______ _____ _   _ ____   ____ 
|  _ \_   _|  _ \| |/ / ____\ \ / / ___| ____| \ | |  _ \ / ___|
| |_) || | | |_) | ' /|  _|  \ V / |  _|  _| |  \| | |_) | |    
|  _ < | | |  _ <| . \| |___  | || |_| | |___| |\  |  __/| |___ 
|_| \_\|_| |_| \_\_|\_\_____| |_| \____|_____|_| \_|_|    \____|
       
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ownsec/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-routerkeygenPC.txt") -r -- sudo apt-get install -y
### DEPS END

sudo rm -r build
mkdir build
cd build
sudo make uninstall
make clean
cd ..
#GITSBMDLINIT
cd build
cmake ..
make -j 4
sudo make install
