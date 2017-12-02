#!/bin/bash

#make not working

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/z3APA3A/3proxy
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A/3proxy
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFL=3proxy.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ____  ____   _____  ____   __
|___ /|  _ \|  _ \ / _ \ \/ /\ \ / /
  |_ \| |_) | |_) | | | \  /  \ V / 
 ___) |  __/|  _ <| |_| /  \   | |  
|____/|_|   |_| \_\\___/_/\_\  |_|  
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

make -f makefile.unix

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

