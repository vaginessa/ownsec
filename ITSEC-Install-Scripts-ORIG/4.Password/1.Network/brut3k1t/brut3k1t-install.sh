#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/ex0dus-0x/brut3k1t.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x
EXECUTEABLE1=brut3k1t.sh
EXECUTEABLE2=brut3k1t
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brut3k1t
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/brut3k1t
DSKTPFL=brut3k1t.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brut3k1t
#ph1a

echo "${bold}
 ____  ____  _   _ _____ _____ _  ___ _____ 
| __ )|  _ \| | | |_   _|___ /| |/ / |_   _|
|  _ \| |_) | | | | | |   |_ \| ' /| | | |  
| |_) |  _ <| |_| | | |  ___) | . \| | | |  
|____/|_| \_\\___/  |_| |____/|_|\_\_| |_|  
          
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-brut3k1t.txt") -r -- sudo apt-get install -y

sudo -H pip2 install asn1crypto
sudo updatedb
sudo ldconfig
sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
./brut3k1t "$@"' > $EXECUTEABLE1
CHMODXEX1

SYMLINKEX2TO1

#333d
CPDESKTFL
