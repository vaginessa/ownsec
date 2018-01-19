#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/seifreed/dirb.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/dirb
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer/dirb
DSKTPFL=dirb.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/dirb
#hd6cv

echo "${bold}
 ____ ___ ____  ____  
|  _ \_ _|  _ \| __ ) 
| | | | || |_) |  _ \ 
| |_| | ||  _ <| |_) |
|____/___|_| \_\____/ 
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
#sudo rm  /usr/local/bin/$EXECUTEABLE2
sudo make uninstall
GITRESET

GITSBMDLINIT

./configure
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