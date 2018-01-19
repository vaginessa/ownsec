#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/schweikert/fping.git
BRANCH=develop
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/fping
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/fping
DSKTPFL=fping.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/fping
#hd6cv

echo "${bold}
 _____ ____ ___ _   _  ____ 
|  ___|  _ \_ _| \ | |/ ___|
| |_  | |_) | ||  \| | |  _ 
|  _| |  __/| || |\  | |_| |
|_|   |_|  |___|_| \_|\____|
         
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

./autogen.sh
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
