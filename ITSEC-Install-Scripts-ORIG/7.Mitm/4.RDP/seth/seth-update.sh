#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/SySS-Research/Seth
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
GITCONFDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research
EXECUTEABLE1=seth.sh
EXECUTEABLE2=seth
EXECUTEABLE3=seth.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/4.RDP/seth
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/4.RDP/seth
DSKTPFL=seth.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/4.RDP/seth
#ph1a
echo "${bold}
 ____  _____ _____ _   _ 
/ ___|| ____|_   _| | | |
\___ \|  _|   | | | |_| |
 ___) | |___  | | |  _  |
|____/|_____| |_| |_| |_|
                         
UPDATE /SySS-Research/Seth
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

cd /opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
python seth.py "$@"' > $GITREPOROOT/$EXECUTEABLE1

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

