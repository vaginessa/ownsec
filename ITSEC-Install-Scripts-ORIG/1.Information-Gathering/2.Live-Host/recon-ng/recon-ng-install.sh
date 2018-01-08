#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://bitbucket.org/LaNMaSteR53/recon-ng.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53/recon-ng
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53
EXECUTEABLE1=recon-ng
EXECUTEABLE2=recon-ng
EXECUTEABLE3=recon-cli
EXECUTEABLE4=recon-cli
EXECUTEABLE5=recon-rpc
EXECUTEABLE6=recon-rpc
EXECUTEABLE7=recon-web
EXECUTEABLE8=recon-web
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/recon-ng
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/recon-ng
DSKTPFL=recon-ng.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _____ ____ ___  _   _       _   _  ____ 
|  _ \| ____/ ___/ _ \| \ | |     | \ | |/ ___|
| |_) |  _|| |  | | | |  \| |_____|  \| | |  _ 
|  _ <| |__| |__| |_| | |\  |_____| |\  | |_| |
|_| \_\_____\____\___/|_| \_|     |_| \_|\____|
          
INSTALL  
${normal}"


mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-recon-ng.txt") -r -- sudo apt-get install -y
### DEPS END

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo rm -f $BINDIR/$EXECUTEABLE6
sudo rm -f $BINDIR/$EXECUTEABLE8

GITSBMDLINIT
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4

chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 $BINDIR/$EXECUTEABLE6

chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 $BINDIR/$EXECUTEABLE8

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


