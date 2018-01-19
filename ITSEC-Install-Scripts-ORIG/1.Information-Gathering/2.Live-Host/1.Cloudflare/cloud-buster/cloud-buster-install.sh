#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/SageHack/cloud-buster.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack
EXECUTEABLE1=bust.sh
EXECUTEABLE2=bust
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Cloudflare/cloud-buster
DSKTPFL=cloud-buster.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Cloudflare/cloud-buster
#ph1a

echo "${bold}
  ____ _     ___  _   _ ____        ____  _   _ ____ _____ _____ ____  
 / ___| |   / _ \| | | |  _ \      | __ )| | | / ___|_   _| ____|  _ \ 
| |   | |  | | | | | | | | | |_____|  _ \| | | \___ \ | | |  _| | |_) |
| |___| |__| |_| | |_| | |_| |_____| |_) | |_| |___) || | | |___|  _ < 
 \____|_____\___/ \___/|____/      |____/ \___/|____/ |_| |_____|_| \_\
         
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo -H pip3 install --upgrade pip
sudo -H pip3 install dnspython3
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
python3 bust "$@"' > $GITREPOROOT/$EXECUTEABLE1


CHMODXEX1
SYMLINKEX2TO1 
#333d
CPDESKTFL
#bust