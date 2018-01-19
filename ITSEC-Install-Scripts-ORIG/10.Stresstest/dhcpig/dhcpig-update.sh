#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/kamorin/DHCPig
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig
GITCONFDIR=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/dhcpig/kamorin
EXECUTEABLE1=pig.py
EXECUTEABLE2=dhcPIG
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/dhcpig
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/dhcpig
DSKTPFL=dhcpig.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/dhcpig
#hd6cv

echo "${bold}
 ____  _   _  ____ ____ ___ ____ 
|  _ \| | | |/ ___|  _ \_ _/ ___|
| | | | |_| | |   | |_) | | |  _ 
| |_| |  _  | |___|  __/| | |_| |
|____/|_| |_|\____|_|  |___\____|
           
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

