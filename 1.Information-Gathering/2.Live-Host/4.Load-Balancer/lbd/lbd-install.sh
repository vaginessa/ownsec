#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git://git.kali.org/packages/lbd.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI
EXECUTEABLE1=lbd
EXECUTEABLE2=lbd
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer
DSKTPFL=lbd.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _     ____  ____  
| |   | __ )|  _ \ 
| |   |  _ \| | | |
| |___| |_) | |_| |
|_____|____/|____/ 
               
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

sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL