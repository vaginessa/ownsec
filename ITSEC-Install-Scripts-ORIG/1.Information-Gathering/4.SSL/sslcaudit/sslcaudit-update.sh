#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/grwl/sslcaudit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslcaudit/grwl/sslcaudit
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslcaudit/grwl/sslcaudit/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslcaudit/grwl
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFL=sslcaudit.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL/sslcaudit
#ph1a

echo "${bold}
 ____ ____  _     ____    _   _   _ ____ ___ _____ 
/ ___/ ___|| |   / ___|  / \ | | | |  _ \_ _|_   _|
\___ \___ \| |  | |     / _ \| | | | | | | |  | |  
 ___) |__) | |__| |___ / ___ \ |_| | |_| | |  | |  
|____/____/|_____\____/_/   \_\___/|____/___| |_|  
              
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

GITRESET

GITSBMDLINIT

sudo -H pip2 install M2Crypto
sudo udpatedb
sudo ldconfig

sudo python setup.py install

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
