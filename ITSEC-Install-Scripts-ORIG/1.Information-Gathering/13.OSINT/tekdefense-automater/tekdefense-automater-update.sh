#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/1aN0rmus/TekDefense-Automater.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus/TekDefense-Automater
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus/TekDefense-Automater/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus
EXECUTEABLE1=Automater.py
EXECUTEABLE2=automater
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/tekdefense-automater
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/tekdefense-automater
DSKTPFL=automater.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/tekdefense-automater
#hd6cv

echo "${bold}
    _   _   _ _____ ___  __  __    _  _____ _____ ____  
   / \ | | | |_   _/ _ \|  \/  |  / \|_   _| ____|  _ \ 
  / _ \| | | | | || | | | |\/| | / _ \ | | |  _| | |_) |
 / ___ \ |_| | | || |_| | |  | |/ ___ \| | | |___|  _ < 
/_/   \_\___/  |_| \___/|_|  |_/_/   \_\_| |_____|_| \_\
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

CHMODXEX1
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

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
