#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/roobixx/cowpatty.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
EXECUTEABLE1=cowpatty
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/1.WEP_WPA/cowpatty
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/1.WEP_WPA/cowpatty
DSKTPFL=cowpatty.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a
echo "${bold}
  ____ _____        ______   _  _____ _______   __
 / ___/ _ \ \      / /  _ \ / \|_   _|_   _\ \ / /
| |  | | | \ \ /\ / /| |_) / _ \ | |   | |  \ V / 
| |__| |_| |\ V  V / |  __/ ___ \| |   | |   | |  
 \____\___/  \_/\_/  |_| /_/   \_\_|   |_|   |_|  
         
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
sudo chmod +x $EXECUTEABLE1
SYMLINKEX1TO1

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
