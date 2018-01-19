#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/P0cL4bs/WiFi-Pumpkin.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs/WiFi-Pumpkin
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/wifi-pumpkin
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/wifi-pumpkin
DSKTPFL=wifipumpkin.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/wifi-pumpkin
#ph1a
echo "${bold}
__        _____ _____ ___ ____  _   _ __  __ ____  _  _____ _   _ 
\ \      / /_ _|  ___|_ _|  _ \| | | |  \/  |  _ \| |/ /_ _| \ | |
 \ \ /\ / / | || |_   | || |_) | | | | |\/| | |_) | ' / | ||  \| |
  \ V  V /  | ||  _|  | ||  __/| |_| | |  | |  __/| . \ | || |\  |
   \_/\_/  |___|_|   |___|_|    \___/|_|  |_|_|   |_|\_\___|_| \_|
         
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-wifipumpkin.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT
sed -i -e 's/pip install /sudo -H pip2 install /g' installer.sh
sed -i -e 's/scapy hostapd rfkill/scapy rfkill/g' installer.sh
sed -i -e 's/pip install /sudo -H pip2 install /g' make_deb.sh
sed -i -e 's/scapy hostapd rfkill/scapy rfkill/g' make_deb.sh
chmod +x installer.sh
chmod +x make_deb.sh

sudo ./make_deb.sh
cd /opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs/WiFi-Pumpkin/deb_tmp/
sudo bash -c 'for DEBWP in $(ls wifi-pumpkin_*); do sudo dpkg -i $DEBWP;done'


#333d
CPDESKTFL