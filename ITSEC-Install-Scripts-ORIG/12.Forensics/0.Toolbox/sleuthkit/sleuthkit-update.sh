#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sleuthkit/sleuthkit
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit
GITCONFDIR=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit/.git
GITCLONEDIR=/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=dnschef.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____  _     _____ _   _ _____ _   _ _  _____ _____ 
/ ___|| |   | ____| | | |_   _| | | | |/ /_ _|_   _|
\___ \| |   |  _| | | | | | | | |_| | ' / | |  | |  
 ___) | |___| |___| |_| | | | |  _  | . \ | |  | |  
|____/|_____|_____|\___/  |_| |_| |_|_|\_\___| |_|  
          UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libewf-dev libafflib-dev
sudo udpatedb
sudo ldconfig


GITCLONEFUNC
sudo make uninstall
GITRESET
GITSBMDLINIT
./bootstrap 
./configure
make -j 4
sudo make install
1
2
3
4
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi