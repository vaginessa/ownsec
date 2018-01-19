#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/netsniff-ng/netsniff-ng.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng/netsniff-ng
GITCONFDIR=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng/netsniff-ng.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/netsniff-ng
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/netsniff-ng
DSKTPFL=netsniff.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/netsniff-ng
#ph1a

echo "${bold}
 _   _ _____ _____ ____  _   _ ___ _____ _____     _   _  ____ 
| \ | | ____|_   _/ ___|| \ | |_ _|  ___|  ___|   | \ | |/ ___|
|  \| |  _|   | | \___ \|  \| || || |_  | |_ _____|  \| | |  _ 
| |\  | |___  | |  ___) | |\  || ||  _| |  _|_____| |\  | |_| |
|_| \_|_____| |_| |____/|_| \_|___|_|   |_|       |_| \_|\____|
        
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

./configure 
make -j 4
sudo make install
#333d
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
