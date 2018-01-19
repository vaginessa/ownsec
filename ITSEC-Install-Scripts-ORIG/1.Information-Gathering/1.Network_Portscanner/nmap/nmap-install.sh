#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/nmap/nmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/nmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/nmap
DSKTPFL=nmap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/nmap
#ph1a

echo "${bold}
 _   _ __  __    _    ____  
| \ | |  \/  |  / \  |  _ \ 
|  \| | |\/| | / _ \ | |_) |
| |\  | |  | |/ ___ \|  __/ 
|_| \_|_|  |_/_/   \_\_|    
            
/nmap/nmap
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-nmap.txt") -r -- sudo apt-get install -y
# sudo updatedb
# sudo ldconfig
### DEPS END

make clean
GITSBMDLINIT

./configure
make -j 4
sudo make install
#333d 
CPDESKTFL

