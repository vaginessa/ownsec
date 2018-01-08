#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/robertdavidgraham/masscan.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham/masscan
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=masscan.desktop
APTLSTDIR=/opt/ownsec/1.Information-Gathering/1.Network_Portscanner/masscan
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 __  __    _    ____ ____   ____    _    _   _ 
|  \/  |  / \  / ___/ ___| / ___|  / \  | \ | |
| |\/| | / _ \ \___ \___ \| |     / _ \ |  \| |
| |  | |/ ___ \ ___) |__) | |___ / ___ \| |\  |
|_|  |_/_/   \_\____/____/ \____/_/   \_\_| \_|
        
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-masscan.txt") -r -- sudo apt-get install -y
sudo update
sudo ldconfig
### DEPS END

GITSBMDLINIT
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL



