#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/rofl0r/proxychains-ng
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r/proxychains-ng
GITCLONEDIR=/opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/proxychains-ng
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/proxychains-ng
DSKTPFL=proxychains-ng.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/proxychains-ng
#ph1a

echo "${bold}
 ____  ____   _____  ____   ______ _   _    _    ___ _   _ ____  _  _   
|  _ \|  _ \ / _ \ \/ /\ \ / / ___| | | |  / \  |_ _| \ | / ___|| || |  
| |_) | |_) | | | \  /  \ V / |   | |_| | / _ \  | ||  \| \___ \| || |_ 
|  __/|  _ <| |_| /  \   | || |___|  _  |/ ___ \ | || |\  |___) |__   _|
|_|   |_| \_\\___/_/\_\  |_| \____|_| |_/_/   \_\___|_| \_|____/   |_|  
        
INSTALL
${normal}"

#plh11
GITCLONEFUNC
### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

./configure --prefix=/usr --sysconfdir=/etc
make -j 4
sudo make install 
sudo make install-config
#333d
CPDESKTFL
