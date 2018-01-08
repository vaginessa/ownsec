#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/portcullislabs/enum4linux.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs/enum4linux
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
EXECUTEABLE1=enum4linux.pl 
EXECUTEABLE2=enum4linux
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=enum4linux.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ _   _ _   _ __  __ _  _   _     ___ _   _ _   ___  __
| ____| \ | | | | |  \/  | || | | |   |_ _| \ | | | | \ \/ /
|  _| |  \| | | | | |\/| | || |_| |    | ||  \| | | | |\  / 
| |___| |\  | |_| | |  | |__   _| |___ | || |\  | |_| |/  \ 
|_____|_| \_|\___/|_|  |_|  |_| |_____|___|_| \_|\___//_/\_\
   
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

chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


