#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

BASEDIR=/opt/ownsec/8.Tunnel

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

8.Tunnel
${normal}"

################## 8.Tunnel ##################

## 1.Pivot

#cd $BASEDIR/1.Pivot/3proxy

cd $BASEDIR/1.Pivot/pivoter
./pivoter-update.sh
# main

#cd $BASEDIR/anonym8
#./anonym8-update.sh
cd $BASEDIR/dns2tcp
./dns2tcp-update.sh

cd $BASEDIR/iodine
./iodine-update.sh
#cd $BASEDIR/mallory
#./mallory-update.sh
#cd $BASEDIR/miredo
#./miredo-update.sh
cd $BASEDIR/proxychains-ng
./proxychains-ng-update.sh
#cd $BASEDIR/proxytunnel
#./proxytunnel-update.sh
cd $BASEDIR/ptunnel
./ptunnel-update.sh
cd $BASEDIR/pwnat
./pwnat-update.sh
cd $BASEDIR/sslh
./sslh-update.sh
#cd $BASEDIR/stunnel
#./stunnel-update.sh
cd $BASEDIR/udptunnel
./udptunnel-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
6.Wireless
${normal}"
