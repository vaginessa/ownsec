#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/jaygreig86/dmitry.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86
EXECUTEABLE1=dmitry
EXECUTEABLE2=dmitry
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/dmitry
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/dmitry
DSKTPFL=dmitry.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/dmitry
#hd6cv

echo "${bold}
 ____  __  __ ___ _____ ______   __
|  _ \|  \/  |_ _|_   _|  _ \ \ / /
| | | | |\/| || |  | | | |_) \ V / 
| |_| | |  | || |  | | |  _ < | |  
|____/|_|  |_|___| |_| |_| \_\|_|  
            
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

chmod +x configure
chmod +x bootstrap
./bootstrap
./configure
make -j 4


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
