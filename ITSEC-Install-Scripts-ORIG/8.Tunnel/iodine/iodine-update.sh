#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/yarrick/iodine.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine
GITCONFDIR=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/iodine/yarrick
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/iodine
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/iodine
DSKTPFL=iodine.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/iodine
#hd6cv

echo "${bold}
 ___ ___  ____ ___ _   _ _____ 
|_ _/ _ \|  _ \_ _| \ | | ____|
 | | | | | | | | ||  \| |  _|  
 | | |_| | |_| | || |\  | |___ 
|___\___/|____/___|_| \_|_____|
            
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

