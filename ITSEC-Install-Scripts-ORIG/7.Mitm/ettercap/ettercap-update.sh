#!/bin/bash


#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Ettercap/ettercap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/ettercap/Ettercap/ettercap
GITCONFDIR=/opt/ITSEC/7.Mitm/ettercap/Ettercap/ettercap/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/ettercap/Ettercap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/ettercap
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/ettercap
DSKTPFL=ettercap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/ettercap
#ph1a

echo "${bold}
 _____ _____ _____ _____ ____   ____    _    ____  
| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
            
UPDATE
${normal}"
GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
cd build
sudo make uninstall
GITCLONEFUNC
cd build 
sudo make uninstall
GITCLONEFUNC
sudo rm -r build
GITSBMDLINIT

mkdir build
cd build
cmake ../
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

