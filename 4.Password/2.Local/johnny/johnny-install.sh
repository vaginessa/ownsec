#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/shinnok/johnny.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johnny/shinnok
EXECUTEABLE1=johnny
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=johnny.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
     _  ___  _   _ _   _ _   ___   __
    | |/ _ \| | | | \ | | \ | \ \ / /
 _  | | | | | |_| |  \| |  \| |\ V / 
| |_| | |_| |  _  | |\  | |\  | | |  
 \___/ \___/|_| |_|_| \_|_| \_| |_|  
       
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
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-johnny.txt") -r -- sudo apt-get install -y

### DEPS END

GITSBMDLINIT

export QT_SELECT=qt5
qmake
make -j$(nproc)

sudo rm -f $BINDIR/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE1
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
