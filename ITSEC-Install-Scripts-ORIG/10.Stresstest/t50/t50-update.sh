#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/fredericopissarra/t50
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50 
GITCONFDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/t50
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/t50
DSKTPFL=t50.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/t50
#hd6cv

echo "${bold}
 _____ ____   ___  
|_   _| ___| / _ \ 
  | | |___ \| | | |
  | |  ___) | |_| |
  |_| |____/ \___/ 
             
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


