#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/NORMA-Inc/AtEar.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc
EXECUTEABLE1=atear.sh
EXECUTEABLE2=atear
EXECUTEABLE3=run.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/atear
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/atear
DSKTPFL=atear.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/atear
#ph1a

echo "${bold}
    _  _____ _____    _    ____  
   / \|_   _| ____|  / \  |  _ \ 
  / _ \ | | |  _|   / _ \ | |_) |
 / ___ \| | | |___ / ___ \|  _ < 
/_/   \_\_| |_____/_/   \_\_| \_\
           
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
sudo -H pip2 install -r requirements.txt
sudo udpatedb
sudo ldconfig

rm -f $EXECUTEABLE3
echo "#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar 
firefox 127.0.0.1:8080 </dev/null &>/dev/null &
sudo python run.py --iface wlan0" > $EXECUTEABLE1

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

CHMODXEX3
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

