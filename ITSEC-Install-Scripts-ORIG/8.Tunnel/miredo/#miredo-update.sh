#bug https://unix.stackexchange.com/questions/219152/pkglibexecdir-is-not-a-legitimate-directory


#!/bin/bash
#
#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/darconeous/miredo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo
GITCONFDIR=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/miredo/darconeous
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/miredo
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/miredo
DSKTPFL=miredo.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/miredo
#hd6cv

echo "${bold}
 __  __ ___ ____  _____ ____   ___  
|  \/  |_ _|  _ \| ____|  _ \ / _ \ 
| |\/| || || |_) |  _| | | | | | | |
| |  | || ||  _ <| |___| |_| | |_| |
|_|  |_|___|_| \_\_____|____/ \___/ 
          
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
./autogen.sh

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

