#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/iphelix/dnschef.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef
GITCONFDIR=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix
EXECUTEABLE1=dnschef.sh
EXECUTEABLE2=dnschef
EXECUTEABLE3=dnschef.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/2.DNS/dnschef
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS/dnschef
DSKTPFL=dnschef.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/2.DNS/dnschef
#ph1a

echo "${bold}
 ____  _   _ ____   ____ _   _ _____ _____ 
|  _ \| \ | / ___| / ___| | | | ____|  ___|
| | | |  \| \___ \| |   | |_| |  _| | |_   
| |_| | |\  |___) | |___|  _  | |___|  _|  
|____/|_| \_|____/ \____|_| |_|_____|_|    
           
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

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef

python dnschef.py "$@"' > $GITREPOROOT/$EXECUTEABLE1
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

