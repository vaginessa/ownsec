#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=git://git.kali.org/packages/wol-e.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie/wol-e
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
EXECUTEABLE1=wol-e.py
EXECUTEABLE2=wol-e
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/wol-e
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/wol-e
DSKTPFL=wol-e.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/wol-e
#hd6cv


echo "${bold}
__        _____  _          _____ 
\ \      / / _ \| |        | ____|
 \ \ /\ / / | | | |   _____|  _|  
  \ V  V /| |_| | |__|_____| |___ 
   \_/\_/  \___/|_____|    |_____|
            
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

rm -f $BINDIR/$EXECUTEABLE2
SYMLINKEX2TO1

#333d 
CPDESKTFL

#foreman s

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
