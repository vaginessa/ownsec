#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Ethical-H4CK3R/Aircrack
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R
EXECUTEABLE1=aircrack.sh
EXECUTEABLE2=aircrack
EXECUTEABLE3=aircrack.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/aircrack
DSKTPFL=aircrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack
#ph1a

echo "${bold}
    _    _                         _    
   / \  (_)_ __ ___ _ __ __ _  ___| | __
  / _ \ | | '__/ __| '__/ _  |/ __| |/ /
 / ___ \| | | | (__| | | (_| | (__|   < 
/_/   \_\_|_|  \___|_|  \__ _|\___|_|\_\
       
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
#sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig

rm -f $EXECUTEABLE3
echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack

sudo python aircrack.py "$@"' > $EXECUTEABLE3

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

CHMODXEX3
CHMODXEX1

sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2

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
