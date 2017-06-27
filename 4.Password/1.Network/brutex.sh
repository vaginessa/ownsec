#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  _   _ _____ _______  __
| __ )|  _ \| | | |_   _| ____\ \/ /
|  _ \| |_) | | | | | | |  _|  \  / 
| |_) |  _ <| |_| | | | | |___ /  \ 
|____/|_| \_\\___/  |_| |_____/_/\_\
      
${normal}"

mkdir -p /opt/ITSEC/4.Password/1.Network/brutex/1N3
cd /opt/ITSEC/4.Password/1.Network/brutex/1N3
git clone https://github.com/1N3/BruteX

cd /opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX


sed -i 's#/usr/share/brutex#/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX#g' brutex

# Install script for BruteX
#
# VARS
COLOR1='\033[91m'
COLOR2='\033[92m'
COLOR3='\033[92m'
RESET='\e[0m'

echo -e "$COLOR1 __________                __         ____  ___$RESET"
echo -e "$COLOR1 \______   \_______ __ ___/  |_  ____ \   \/  /$RESET"
echo -e "$COLOR1  |    |  _/\_  __ \  |  \   __\/ __ \ \     / $RESET"
echo -e "$COLOR1  |    |   \ |  | \/  |  /|  | \  ___/ /     \ $RESET"
echo -e "$COLOR1  |______  / |__|  |____/ |__|  \___  >___/\  \ $RESET"
echo -e "$COLOR1         \/                         \/      \_/$RESET"
echo ""
echo -e "$COLOR1 + -- --=[BruteX v1.5 by 1N3$RESET"
echo -e "$COLOR1 + -- --=[http://crowdshield.com$RESET"
echo -e "$RESET"

BRUTEX_INSTALL_DIR=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX

echo -e "$OKGREEN + -- --=[This script will install brutex under $BRUTEX_INSTALL_DIR."
cd $BRUTEX_INSTALL_DIR
mkdir loot
chmod +x $BRUTEX_INSTALL_DIR/brutex
sudo rm -f /usr/local/bin/brutex
sudo ln -s $BRUTEX_INSTALL_DIR/brutex /usr/local/bin/brutex

echo -e "$OKORANGE + -- --=[Done!$RESET"
