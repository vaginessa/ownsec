#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/P0cL4bs/WiFi-Pumpkin.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs/WiFi-Pumpkin
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=wifipumpkin.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
__        _____ _____ ___ ____  _   _ __  __ ____  _  _____ _   _ 
\ \      / /_ _|  ___|_ _|  _ \| | | |  \/  |  _ \| |/ /_ _| \ | |
 \ \ /\ / / | || |_   | || |_) | | | | |\/| | |_) | ' / | ||  \| |
  \ V  V /  | ||  _|  | ||  __/| |_| | |  | |  __/| . \ | || |\  |
   \_/\_/  |___|_|   |___|_|    \___/|_|  |_|_|   |_|\_\___|_| \_|
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
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


mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL