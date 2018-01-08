#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/fredericopissarra/t50
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50
GITCLONEDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/t50
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/t50
DSKTPFL=t50.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/t50
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 _____ ____   ___  
|_   _| ___| / _ \ 
  | | |___ \| | | |
  | |  ___) | |_| |
  |_| |____/ \___/ 
             
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo make uninstall
GITSBMDLINIT
./configure
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL