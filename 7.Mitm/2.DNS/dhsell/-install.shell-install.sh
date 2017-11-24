#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/USArmyResearchLab/Dshell
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab/Dshell
GITCLONEDIR=/opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab
#EXECUTEABLE1=
EXECUTEABLE2=dshell
EXECUTEABLE3=dshell-decode
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm/2.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS
DSKTPFL1=dshell.desktop
DSKTPFL2=dshell-decode.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  ____  _   _ _____ _     _     
|  _ \/ ___|| | | | ____| |   | |    
| | | \___ \| |_| |  _| | |   | |    
| |_| |___) |  _  | |___| |___| |___ 
|____/|____/|_| |_|_____|_____|_____|
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

make clean
GITSBMDLINIT
#Build
make -j 4

#Install -- Create new Executeable Symlink
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE3
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2