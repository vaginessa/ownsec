#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

BASEDIR=/opt/ownsec/7.Mitm

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

7.Mitm
${normal}"

################## 7.Mitm ##################

#cd $BASEDIR/bdfproxy
#./bdfproxy-update.sh
cd $BASEDIR/bettercap
./bettercap-update.sh
cd $BASEDIR/cdpsnarf
./cdpsnarf-update.sh
cd $BASEDIR/det
./det-update.sh
#cd $BASEDIR/dripcap
#./dripcap-update.sh
cd $BASEDIR/ettercap
./ettercap-update.sh
#cd $BASEDIR/hexinject
#./hexinject-update.sh
cd $BASEDIR/hyperfox
./hyperfox-update.sh
cd $BASEDIR/mitmf
./mitmf-update.sh
#cd $BASEDIR/mitmproxy
#./mitmproxy-update.sh
# cd $BASEDIR/moloch
#./moloch-update.sh
cd $BASEDIR/morpheus
./morpheus-update.sh
cd $BASEDIR/netsniff-ng
./netsniff-ng-update.sh
cd $BASEDIR/nfspy
./nfspy-update.sh
cd $BASEDIR/p0f
./p0f-update.sh
cd $BASEDIR/responder
./responder-update.sh
cd $BASEDIR/sniffjoke
./sniffjoke-update.sh
#cd $BASEDIR/sslsniff
#./sslsniff-update.sh
cd $BASEDIR/sslsplit
./sslsplit-update.sh
#cd $BASEDIR/stenographer
#./stenographer-update.sh
cd $BASEDIR/tcpflow
./tcpflow-update.sh
cd $BASEDIR/wireshark
./wireshark-update.sh

### 2.DNS

cd $BASEDIR/2.DNS/dhsell

cd $BASEDIR/2.DNS/dnschef

### 3.VPN

cd $BASEDIR/3.VPN/fiked
./fiked-update.sh

### 4.RDP

cd $BASEDIR/4.RDP/seth
./seth-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
7.Mitm
${normal}"

