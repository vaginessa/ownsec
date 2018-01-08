#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/yrutschle/sslh.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
GITCLONEDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=sslh.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ____  _     _   _ 
/ ___/ ___|| |   | | | |
\___ \___ \| |   | |_| |
 ___) |__) | |___|  _  |
|____/____/|_____|_| |_|
            
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
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-sslh.txt") -r -- sudo apt-get install -y

sudo -H pip2 install virtualenvwrapper
sudo ldconfig
sudo updatedb
 
sudo -H pip2 install -r requirements.txt
sudo ldconfig
sudo updatedb
### DEPS END
make clean
GITSBMDLINIT

make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

