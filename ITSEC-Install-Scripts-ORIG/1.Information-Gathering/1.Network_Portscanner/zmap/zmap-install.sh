#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/zmap/zmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/zmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/zmap
DSKTPFL=zmap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/zmap
#ph1a

echo "${bold}
 _______  __    _    ____  
|__  /  \/  |  / \  |  _ \ 
  / /| |\/| | / _ \ | |_) |
 / /_| |  | |/ ___ \|  __/ 
/____|_|  |_/_/   \_\_|    
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-zmap.txt") -r -- sudo apt-get install -y
### DEPS END

make clean
GITSBMDLINIT
mkdir build
cd build
cmake ..
make -j 4
sudo make install 

#333d
CPDESKTFL
