#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/lanjelot/patator.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/patator/lanjelot/patator
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/patator/lanjelot
EXECUTEABLE1=patator.sh
EXECUTEABLE2=patator
EXECUTEABLE3=patator.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/patator
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/patator
DSKTPFL=patator.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/patator
#ph1a

echo "${bold}
 ____   _  _____  _  _____ ___  ____  
|  _ \ / \|_   _|/ \|_   _/ _ \|  _ \ 
| |_) / _ \ | | / _ \ | || | | | |_) |
|  __/ ___ \| |/ ___ \| || |_| |  _ < 
|_| /_/   \_\_/_/   \_\_| \___/|_| \_\
          
INSTALL
${normal}"

#plh11
GITCLONEFUNC 

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-patator.txt") -r -- sudo apt-get install -y
sudo -H pip2 install pyOpenSSL impacket IPy dnspython
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/patator/lanjelot/patator

python patator.py "$@"' > $EXECUTEABLE1
CHMODXEX3
CHMODXEX1

SYMLINKEX2TO1
#333d
CPDESKTFL
