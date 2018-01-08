#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Ettercap/ettercap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/ettercap/Ettercap/ettercap
GITCLONEDIR=/opt/ITSEC/7.Mitm/ettercap/Ettercap
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=ettercap.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 _____ _____ _____ _____ ____   ____    _    ____  
| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
            
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

cd build
sudo make uninstall
cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ownsec/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-ettercap.txt") -r -- sudo apt-get install -y
### DEPS END

sudo rm -r build
GITSBMDLINIT

mkdir build
cd build
cmake ../
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL