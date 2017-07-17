#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _    _    _   _ ____  ____  _   _    _    _  _______ ____  
| | | |  / \  | \ | |  _ \/ ___|| | | |  / \  | |/ / ____|  _ \ 
| |_| | / _ \ |  \| | | | \___ \| |_| | / _ \ | ' /|  _| | |_) |
|  _  |/ ___ \| |\  | |_| |___) |  _  |/ ___ \| . \| |___|  _ < 
|_| |_/_/   \_\_| \_|____/|____/|_| |_/_/   \_\_|\_\_____|_| \_\
                
${normal}"

rm -rf /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
cd /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
git clone https://github.com/d4rkcat/HandShaker
#
cd /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker

sudo make

echo '#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker

sudo ./handshaker.sh -i wlan0 -i2 wlan1 "$@"' > handshaker_w_wlan0_wlan1.sh

chmod +x handshaker_w_wlan0_wlan1.sh
sudo rm -f /usr/local/bin/handshaker_autowlan
sudo ln -s /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker/handshaker_w_wlan0_wlan1.sh /usr/local/bin/handshaker_autowlan

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=handshaker.desktop
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

