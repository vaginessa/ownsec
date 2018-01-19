#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/yrutschle/sslh.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
GITCONFDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/sslh
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnell/sslh
DSKTPFL=pwnat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/sslh
#hd6cv

echo "${bold}
 ____ ____  _     _   _ 
/ ___/ ___|| |   | | | |
\___ \___ \| |   | |_| |
 ___) |__) | |___|  _  |
|____/____/|_____|_| |_|
            
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

