#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/r00t-3xp10it/morpheus.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus
GITCONFDIR=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it
EXECUTEABLE1=morpheus.sh
EXECUTEABLE2=morpheus
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/morpheus
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/morpheus
DSKTPFL=morpheus.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/morpheus
#hd6cv

echo "${bold}
 __  __  ___  ____  ____  _   _ _____ _   _ ____  
|  \/  |/ _ \|  _ \|  _ \| | | | ____| | | / ___| 
| |\/| | | | | |_) | |_) | |_| |  _| | | | \___ \ 
| |  | | |_| |  _ <|  __/|  _  | |___| |_| |___) |
|_|  |_|\___/|_| \_\_|   |_| |_|_____|\___/|____/ 
              
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

SYMLINKEX2TO1
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

