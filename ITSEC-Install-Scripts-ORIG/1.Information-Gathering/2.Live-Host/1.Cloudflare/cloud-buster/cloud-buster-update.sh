#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/SageHack/cloud-buster.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack
EXECUTEABLE1=bust.sh
EXECUTEABLE2=bust
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Cloudflare/cloud-buster
DSKTPFL=cloud-buster.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Cloudflare/cloud-buster
#ph1a
GITRESET

echo "${bold}
  ____ _     ___  _   _ ____        ____  _   _ ____ _____ _____ ____  
 / ___| |   / _ \| | | |  _ \      | __ )| | | / ___|_   _| ____|  _ \ 
| |   | |  | | | | | | | | | |_____|  _ \| | | \___ \ | | |  _| | |_) |
| |___| |__| |_| | |_| | |_| |_____| |_) | |_| |___) || | | |___|  _ < 
 \____|_____\___/ \___/|____/      |____/ \___/|____/ |_| |_____|_| \_\
         
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT
sudo -H pip3 install --upgrade pip
sudo -H pip3 install dnspython3

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
python3 bust "$@"' > $GITREPOROOT/$EXECUTEABLE1

RMBDREX2
CHMODXEX1
RMBDREX2
SYMLINKEX2TO1

#333d

CPDESKTFL

#bust

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi