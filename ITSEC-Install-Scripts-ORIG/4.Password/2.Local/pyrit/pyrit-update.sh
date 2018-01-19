#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/JPaulMora/Pyrit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pyrit
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/pyrit
DSKTPFL=pyrit.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pyrit
#ph1a
echo "${bold}
 ______   ______  ___ _____ 
|  _ \ \ / /  _ \|_ _|_   _|
| |_) \ V /| |_) || |  | |  
|  __/ | | |  _ < | |  | |  
|_|    |_| |_| \_\___| |_|  
            
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
