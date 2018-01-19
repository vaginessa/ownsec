#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/mteg/braa.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg
EXECUTEABLE1=braa
EXECUTEABLE2=braa
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/8.SNMP/braa
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/8.SNMP/braa
DSKTPFL=braa.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/8.SNMP/braa
#hd6cv


echo "${bold}
 ____  ____      _        _    
| __ )|  _ \    / \      / \   
|  _ \| |_) |  / _ \    / _ \  
| |_) |  _ <  / ___ \  / ___ \ 
|____/|_| \_\/_/   \_\/_/   \_\

INSTALL
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

make -j 4
CHMODXEX1
sudo rm $BINDIR/$EXECUTEABLE2
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