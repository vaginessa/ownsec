#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/grwl/sslcaudit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl/sslcaudit
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslaudit/grwl
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFL=sslcaudit.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ____  _     ____    _   _   _ ____ ___ _____ 
/ ___/ ___|| |   / ___|  / \ | | | |  _ \_ _|_   _|
\___ \___ \| |  | |     / _ \| | | | | | | |  | |  
 ___) |__) | |__| |___ / ___ \ |_| | |_| | |  | |  
|____/____/|_____\____/_/   \_\___/|____/___| |_|  
             
INSTALL 
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

sudo python setup.py install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

