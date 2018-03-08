#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/samyk/pwnat.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/pwnat/samyk/pwnat
GITCONFDIR=/opt/ITSEC/8.Tunnel/pwnat/samyk/pwnat/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/pwnat/samyk
EXECUTEABLE1=pwnat	
EXECUTEABLE2=pwnat
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/pwnat
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/pwnat
DSKTPFL=pwnat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/pwnat
#hd6cv

echo "${bold}
 ______        ___   _    _  _____ 
|  _ \ \      / / \ | |  / \|_   _|
| |_) \ \ /\ / /|  \| | / _ \ | |  
|  __/ \ V  V / | |\  |/ ___ \| |  
|_|     \_/\_/  |_| \_/_/   \_\_|  
             
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
make clean
GITRESET
GITSBMDLINIT
make -j 4

#sudo make install doesent work
#

CHMODXEX1
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

