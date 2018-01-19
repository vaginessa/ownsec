#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/royhills/ike-scan.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills/ike-scan
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan
DSKTPFL=ike-scan.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan
#ph1a

echo "${bold}
 ___ _  _______     ____   ____    _    _   _ 
|_ _| |/ / ____|   / ___| / ___|  / \  | \ | |
 | || ' /|  _| ____\___ \| |     / _ \ |  \| |
 | || . \| |__|_____|__) | |___ / ___ \| |\  |
|___|_|\_\_____|   |____/ \____/_/   \_\_| \_|
   
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

autoreconf --install
./configure --with-openssl
make -j 4
sudo make install
#333d
CPDESKTFL
