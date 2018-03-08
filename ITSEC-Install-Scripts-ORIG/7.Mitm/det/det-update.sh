#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sensepost/DET.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/det/sensepost/DET
GITCONFDIR=/opt/ITSEC/7.Mitm/det/sensepost/DET/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/det/sensepost
EXECUTEABLE1=det.sh
EXECUTEABLE2=det
EXECUTEABLE3=det.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/det
DSKTPFLSDEST=/home/$USER/.local/share/applications/det
DSKTPFL=det.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/det
#ph1a
echo "${bold}
 ____  _____ _____ 
|  _ \| ____|_   _|
| | | |  _|   | |  
| |_| | |___  | |  
|____/|_____| |_|  
          
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
GITCLONEFUNC
GITSBMDLINIT
#ph4gh

echo '#!/bin/bash -i 

cd /opt/ITSEC/7.Mitm/det/sensepost/DET
python det.py "$@"' > $GITREPOROOT/$EXECUTEABLE1

CHMODXEX1
CHMODXEX3

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

