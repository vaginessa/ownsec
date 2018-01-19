#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/epsylon/ufonet
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
GITCONFDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon
EXECUTEABLE1=ufonet.sh
EXECUTEABLE2=ufonet
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/ufonet
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/ufonet
DSKTPFL=ufonet.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/ufonet
#hd6cv

echo "${bold}
 _   _ _____ ___  _   _ _____ _____ 
| | | |  ___/ _ \| \ | | ____|_   _|
| | | | |_ | | | |  \| |  _|   | |  
| |_| |  _|| |_| | |\  | |___  | |  
 \___/|_|   \___/|_| \_|_____| |_|  
           
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

#sudo python setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
./ufonet "$@"' > $EXECUTEABLE1
CHMODXEX1
CHMODXEX2

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

