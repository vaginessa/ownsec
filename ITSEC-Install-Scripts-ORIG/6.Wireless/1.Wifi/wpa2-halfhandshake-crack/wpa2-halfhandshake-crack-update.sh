#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/dxa4481/WPA2-HalfHandshake-Crack
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481
EXECUTEABLE1=halfHandshake.sh
EXECUTEABLE2=halfHandshake
EXECUTEABLE3=halfHandshake.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/wpa2-halfhandshake-crack
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/wpa2-halfhandshake-crack
DSKTPFL=wpa2-halfhandshake-crack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/wpa2-halfhandshake-crack
#ph1a

echo "${bold}
 _   _ _     _____ _   _ _   _ ____  ____  _   _ _  _______ 
| | | | |   |  ___| | | | \ | |  _ \/ ___|| | | | |/ / ____|
| |_| | |   | |_  | |_| |  \| | | | \___ \| |_| | ' /|  _|  
|  _  | |___|  _| |  _  | |\  | |_| |___) |  _  | . \| |___ 
|_| |_|_____|_|   |_| |_|_| \_|____/|____/|_| |_|_|\_\_____|
               
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
sudo python setup.py install

echo '#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack/

python halfHandshake.py "$@" ' > $EXECUTEABLE1

chmod +x  $GITREPOROOT/$EXECUTEABLE3
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

