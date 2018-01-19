#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/zmap/zmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/zmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/zmap
DSKTPFL=zmap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/zmap
#ph1a
GITRESET

echo "${bold}
 _______  __    _    ____  
|__  /  \/  |  / \  |  _ \ 
  / /| |\/| | / _ \ | |_) |
 / /_| |  | |/ ___ \|  __/ 
/____|_|  |_/_/   \_\_|    
            
UPDATE CHECK
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

cd build
make clean
GITCLONEFUNC
rm -f build
GITRESET
GITSBMDLINIT

mkdir build
cd build
cmake ..
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


