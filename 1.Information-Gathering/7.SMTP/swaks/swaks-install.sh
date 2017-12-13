#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/roman-rybalko/swaks.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko/swaks
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko
EXECUTEABLE1=swaks
EXECUTEABLE2=swaks
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFL=swaks.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ______        ___    _  ______  
/ ___\ \      / / \  | |/ / ___| 
\___ \\ \ /\ / / _ \ | ' /\___ \ 
 ___) |\ V  V / ___ \| . \ ___) |
|____/  \_/\_/_/   \_\_|\_\____/ 
            
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL