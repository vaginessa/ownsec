#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/nmap/nmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=nmap.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ __  __    _    ____  
| \ | |  \/  |  / \  |  _ \ 
|  \| | |\/| | / _ \ | |_) |
| |\  | |  | |/ ___ \|  __/ 
|_| \_|_|  |_/_/   \_\_|    
            
/nmap/nmap
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-nmap.txt") -r -- sudo apt-get install -y
# sudo updatedb
# sudo ldconfig
### DEPS END

make clean
GITSBMDLINIT

./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

