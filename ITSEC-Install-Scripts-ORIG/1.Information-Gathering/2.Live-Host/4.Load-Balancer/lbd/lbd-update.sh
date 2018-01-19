#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=git://git.kali.org/packages/lbd.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI
EXECUTEABLE1=lbd
EXECUTEABLE2=lbd
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
DSKTPFL=lbd.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
#hd6cv

echo "${bold}
 _     ____  ____  
| |   | __ )|  _ \ 
| |   |  _ \| | | |
| |___| |_) | |_| |
|_____|____/|____/ 
              
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