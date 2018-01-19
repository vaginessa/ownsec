#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/vanhauser-thc/thc-ipv6.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc/thc-ipv6
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6
DSKTPFL=thcping6.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6
#ph1a

echo "${bold}
 _____ _   _  ____     ___ ______     ____   
|_   _| | | |/ ___|   |_ _|  _ \ \   / / /_  
  | | | |_| | |   _____| || |_) \ \ / / '_ \ 
  | | |  _  | |__|_____| ||  __/ \ V /| (_) |
  |_| |_| |_|\____|   |___|_|     \_/  \___/ 
       
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT
make -j 4
sudo make install

#333d
CPDESKTFL
thc-ipv6-setup.sh