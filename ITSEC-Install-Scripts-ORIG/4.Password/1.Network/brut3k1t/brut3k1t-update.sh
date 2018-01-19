#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/ex0dus-0x/brut3k1t.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x
EXECUTEABLE1=brut3k1t.sh
EXECUTEABLE2=brut3k1t
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brut3k1t
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/brut3k1t
DSKTPFL=brut3k1t.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brut3k1t
#hd6cv

echo "${bold}
 ____  ____  _   _ _____ _____ _  ___ _____ 
| __ )|  _ \| | | |_   _|___ /| |/ / |_   _|
|  _ \| |_) | | | | | |   |_ \| ' /| | | |  
| |_) |  _ <| |_| | | |  ___) | . \| | | |  
|____/|_| \_\\___/  |_| |____/|_|\_\_| |_|  
          
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

sudo -H pip2 install asn1crypto
sudo updatedb
sudo ldconfig
sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
./brut3k1t "$@"' > $EXECUTEABLE1
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

