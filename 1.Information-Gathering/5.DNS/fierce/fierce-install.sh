#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/mschwager/fierce.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager/fierce
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=fierce.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ___ _____ ____   ____ _____ 
|  ___|_ _| ____|  _ \ / ___| ____|
| |_   | ||  _| | |_) | |   |  _|  
|  _|  | || |___|  _ <| |___| |___ 
|_|   |___|_____|_| \_\\____|_____|
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
sudo -H pip3 install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

make clean
GITSBMDLINIT

sudo python3 setup.py install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
