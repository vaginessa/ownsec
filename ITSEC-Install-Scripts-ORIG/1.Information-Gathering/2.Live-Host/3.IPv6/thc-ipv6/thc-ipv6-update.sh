#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/vanhauser-thc/thc-ipv6.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc/thc-ipv6
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc/thc-ipv6/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6
DSKTPFL=thcping6.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6
#hd6cv

echo "${bold}
 _____ _   _  ____     ___ ______     ____   
|_   _| | | |/ ___|   |_ _|  _ \ \   / / /_  
  | | | |_| | |   _____| || |_) \ \ / / '_ \ 
  | | |  _  | |__|_____| ||  __/ \ V /| (_) |
  |_| |_| |_|\____|   |___|_|     \_/  \___/ 
       
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo make uninstall
make clean
GITRESET

GITSBMDLINIT
make -j 4
sudo make install


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