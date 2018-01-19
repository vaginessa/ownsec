#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/p0f/p0f.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/p0f/p0f/p0f
GITCONFDIR=/opt/ITSEC/7.Mitm/p0f/p0f/p0f/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/p0f/p0f
EXECUTEABLE1=p0f.sh
EXECUTEABLE2=p0f
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/p0f
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/p0f
DSKTPFL=p0f.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/p0f
#ph1a


echo "${bold}
 ____   ___  _____ 
|  _ \ / _ \|  ___|
| |_) | | | | |_   
|  __/| |_| |  _|  
|_|    \___/|_|    

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
make -j 4
echo '#!/bin/bash
cd /opt/ITSEC/7.Mitm/p0f/p0f/p0f
./p0f "$@"' > p0f.sh

CHMODXEX2
CHMODXEX1
RMBDREX2
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
