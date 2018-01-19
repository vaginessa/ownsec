#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/trailofbits/onesixtyone.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits
EXECUTEABLE1=onesixtyone.sh
EXECUTEABLE2=onesixtyone
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/onesixtyone
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/onesixtyone
DSKTPFL=onesixtyone.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/onesixtyone
#ph1a

echo "${bold}
  ___  _   _ _____ ____ _____  _________   _____  _   _ _____ 
 / _ \| \ | | ____/ ___|_ _\ \/ /_   _\ \ / / _ \| \ | | ____|
| | | |  \| |  _| \___ \| | \  /  | |  \ V / | | |  \| |  _|  
| |_| | |\  | |___ ___) | | /  \  | |   | || |_| | |\  | |___ 
 \___/|_| \_|_____|____/___/_/\_\ |_|   |_| \___/|_| \_|_____|
               
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

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone

./onesixtyone "$@"' > $EXECUTEABLE1
CHMODXEX3
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

