#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/JoeDog/siege
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege
GITCONFDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog
EXECUTEABLE1=siege
EXECUTEABLE2=siege
#ph1b
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____ ___ _____ ____ _____ 
/ ___|_ _| ____/ ___| ____|
\___ \| ||  _|| |  _|  _|  
 ___) | || |__| |_| | |___ 
|____/___|_____\____|_____|
          
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
CHMODXEX1

SYMLINKEX2TO1
echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
