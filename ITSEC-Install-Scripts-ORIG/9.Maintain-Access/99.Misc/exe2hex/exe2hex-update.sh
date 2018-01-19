#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/g0tmi1k/exe2hex.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k
EXECUTEABLE1=exe2hex.sh
EXECUTEABLE2=exe2hex
EXECUTEABLE3=exe2hex.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/99.Misc/exe2hex
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/99.Misc/exe2hex
DSKTPFL=exe2hex.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/99.Misc/exe2hex
#hd6cv

echo "${bold}
 _______  _______ ____  _   _ _______  __
| ____\ \/ / ____|___ \| | | | ____\ \/ /
|  _|  \  /|  _|   __) | |_| |  _|  \  / 
| |___ /  \| |___ / __/|  _  | |___ /  \ 
|_____/_/\_\_____|_____|_| |_|_____/_/\_\
        
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

cd /opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex

python3 exe2hex.py "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
chmod +x $EXECUTEABLE3

SYMLINKEX2TO1
rm -f  $DSKTPFLSDEST/$DSKTPFL
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


