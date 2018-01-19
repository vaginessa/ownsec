#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/hashcat/hashcat.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/hashcat
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/hashcat
DSKTPFL=hashcat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/hashcat
#ph1a

echo "${bold}
 _   _    _    ____  _   _  ____    _  _____ 
| | | |  / \  / ___|| | | |/ ___|  / \|_   _|
| |_| | / _ \ \___ \| |_| | |     / _ \ | |  
|  _  |/ ___ \ ___) |  _  | |___ / ___ \| |  
|_| |_/_/   \_\____/|_| |_|\____/_/   \_\_|  
            
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

GITCLONEFUNC
git clone https://github.com/hashcat/hashcat-utils

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/hashcat-utils
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
GITCLONEFUNC

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/maskprocessor
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
sudo make install
GITCLONEFUNC

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/statsprocessor
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
sudo make install
GITCLONEFUNC

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/princeprocessor
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
sudo make install
GITCLONEFUNC

make -j 4
sudo make install
sudo 
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



