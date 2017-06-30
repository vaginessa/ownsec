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

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
cd /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
https://github.com/d4rkcat/HandShaker
#
cd /opt/ITSEC/6.Wireless/1.Wifi/HandShaker/d4rkcat/HandShaker

sudo make

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=handshaker.desktop
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

