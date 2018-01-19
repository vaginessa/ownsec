#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Veil-Framework/Veil
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework/Veil
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework/Veil/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework
EXECUTEABLE1=Veil.py
EXECUTEABLE2=Veil
#ph1b
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
__     _______ ___ _     
\ \   / / ____|_ _| |    
 \ \ / /|  _|  | || |    
  \ V / | |___ | || |___ 
   \_/  |_____|___|_____|
                            
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC


cd 
GITRESET
GITSBMDLINIT

sed -i 's/wine-stable/wine/' /opt/ITSEC/9.Maintain-Access/2.Generate/Veil/Veil-Framework/Veil/setup/setup.sh
./setup/setup.sh -c


SYMLINKEX2TO1

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
