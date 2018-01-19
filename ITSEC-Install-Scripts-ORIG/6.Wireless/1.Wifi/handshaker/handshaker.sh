#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/d4rkcat/HandShaker
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
EXECUTEABLE1=handshaker_autowlan.sh
EXECUTEABLE2=handshaker_autowlan
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/handshaker
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/handshaker
DSKTPFL=handshaker.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/handshaker
#ph1a

echo "${bold}
 _   _    _    _   _ ____  ____  _   _    _    _  _______ ____  
| | | |  / \  | \ | |  _ \/ ___|| | | |  / \  | |/ / ____|  _ \ 
| |_| | / _ \ |  \| | | | \___ \| |_| | / _ \ | ' /|  _| | |_) |
|  _  |/ ___ \| |\  | |_| |___) |  _  |/ ___ \| . \| |___|  _ < 
|_| |_/_/   \_\_| \_|____/|____/|_| |_/_/   \_\_|\_\_____|_| \_\
             
INSTALL   
${normal}"

#plh11

GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
sudo make -j 4

echo '#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker

sudo ./handshaker.sh -i wlan0 -i2 wlan1 "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

SYMLINKEX2TO1

#333d 
CPDESKTFL



