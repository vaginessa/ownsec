#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/bonsaiviking/NfSpy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy
GITCONFDIR=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/nfspy
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/nfspy
DSKTPFL=nfspy.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/nfspy
#ph1a

echo "${bold}
 _   _ _____ ____  ______   __
| \ | |  ___/ ___||  _ \ \ / /
|  \| | |_  \___ \| |_) \ V / 
| |\  |  _|  ___) |  __/ | |  
|_| \_|_|   |____/|_|    |_|  
        
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
sudo python setup.py install

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

