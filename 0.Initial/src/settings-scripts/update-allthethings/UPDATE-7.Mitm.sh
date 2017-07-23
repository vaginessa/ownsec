#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

7.Mitm
${normal}"

################## 7.Mitm ##################

#cd /opt/ITSEC-Install-Scripts/7.Mitm/bdfproxy
#./bdfproxy-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/bettercap
./bettercap-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/cdpsnarf
./cdpsnarf-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/det
./det-update.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/dripcap
#./dripcap-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/ettercap
./ettercap-update.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/hexinject
#./hexinject-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/hyperfox
./hyperfox-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/mitmf
./mitmf-update.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/mitmproxy
#./mitmproxy-update.sh
# cd /opt/ITSEC-Install-Scripts/7.Mitm/moloch
#./moloch-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/morpheus
./morpheus-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/netsniff-ng
./netsniff-ng-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/nfspy
./nfspy-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/p0f
./p0f-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/responder
./responder-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/sniffjoke
./sniffjoke-update.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/sslsniff
#./sslsniff-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/sslsplit
./sslsplit-update.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/stenographer
#./stenographer-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/tcpflow
./tcpflow-update.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/wireshark
./wireshark-update.sh

### 2.DNS

cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS/dhsell

cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS/dnschef

### 3.VPN

cd /opt/ITSEC-Install-Scripts/7.Mitm/3.VPN/fiked
./fiked-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
7.Mitm
${normal}"

