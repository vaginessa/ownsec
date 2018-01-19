#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/OpenSecurityResearch/hostapd-wpe.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch
EXECUTEABLE1=hostapd-wpe.sh
EXECUTEABLE2=hostapd-wpe
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
DSKTPFL=hostapd-wpe.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
#ph1a
echo "${bold}
 _   _  ___  ____ _____  _    ____  ____     __        ______  _____ 
| | | |/ _ \/ ___|_   _|/ \  |  _ \|  _ \    \ \      / /  _ \| ____|
| |_| | | | \___ \ | | / _ \ | |_) | | | |____\ \ /\ / /| |_) |  _|  
|  _  | |_| |___) || |/ ___ \|  __/| |_| |_____\ V  V / |  __/| |___ 
|_| |_|\___/|____/ |_/_/   \_\_|   |____/       \_/\_/  |_|   |_____|
        
INSTALL
${normal}"

#plh11

GITCLONEFUNC
GITSBMDLINIT

rm -rf hostapd-2.6
wget http://hostap.epitest.fi/releases/hostapd-2.6.tar.gz
tar -zxf hostapd-2.6.tar.gz
cd hostapd-2.6
patch -p1 < ../hostapd-wpe.patch

cd hostapd
make -j 4
sudo make install
cd ../../certs/
./bootstrap
cd ../hostapd-2.6/hostapd
echo "#!/bin/bash
cd /opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe/hostapd-2.6/hostapd

sudo ./hostapd-wpe hostapd-wpe.conf" >> $EXECUTEABLE1
#cd /opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe
chmod +x $EXECUTEABLE1

#333d 
CPDESKTFL