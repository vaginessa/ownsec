#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/trustedsec/pivoter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter
GITCONFDIR=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/pivoter
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot/pivoter
DSKTPFL=pivoter.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/pivoter
#ph1a

echo "${bold}
 ____ _____     _____ _____ _____ ____  
|  _ \_ _\ \   / / _ \_   _| ____|  _ \ 
| |_) | | \ \ / / | | || | |  _| | |_) |
|  __/| |  \ V /| |_| || | | |___|  _ < 
|_|  |___|  \_/  \___/ |_| |_____|_| \_\
              
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

