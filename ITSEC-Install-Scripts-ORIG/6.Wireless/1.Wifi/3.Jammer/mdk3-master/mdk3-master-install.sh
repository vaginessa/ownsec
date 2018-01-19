#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/camerony/mdk3-master.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony/mdk3-master
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/3.Jammer/mdk3-master
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/3.Jammer/mdk3-master
DSKTPFL=mdk3-master.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/3.Jammer/mdk3-master
#ph1a

echo "${bold}
 __  __ ____  _  _______       __  __    _    ____ _____ _____ ____  
|  \/  |  _ \| |/ /___ /      |  \/  |  / \  / ___|_   _| ____|  _ \ 
| |\/| | | | | ' /  |_ \ _____| |\/| | / _ \ \___ \ | | |  _| | |_) |
| |  | | |_| | . \ ___) |_____| |  | |/ ___ \ ___) || | | |___|  _ < 
|_|  |_|____/|_|\_\____/      |_|  |_/_/   \_\____/ |_| |_____|_| \_\
            
INSTALL      
${normal}"

#plh11
GITCLONEFUNC

sudo make uninstall
make clean
GITSBMDLINIT
make -j 4
sudo make install
#333d
CPDESKTFL

