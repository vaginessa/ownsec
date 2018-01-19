#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

REPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass
BINROOT=/opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass/eapmd5pass
VERSION=1.4
EXECUTEABLE1=eapmd5pass
EXECUTEABLE2=eapmd5pass
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/eapmd5pass
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/eapmd5pass
DSKTPFL=eapmd5pass.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/eapmd5pass

echo "${bold}
 _____    _    ____  __  __ ____  ____  ____   _    ____ ____  
| ____|  / \  |  _ \|  \/  |  _ \| ___||  _ \ / \  / ___/ ___| 
|  _|   / _ \ | |_) | |\/| | | | |___ \| |_) / _ \ \___ \___ \ 
| |___ / ___ \|  __/| |  | | |_| |___) |  __/ ___ \ ___) |__) |
|_____/_/   \_\_|   |_|  |_|____/|____/|_| /_/   \_\____/____/ 
            
INSTALL
${normal}"

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass
cd $REPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm -r $BINROOT
wget http://www.willhackforsushi.com/code/eapmd5pass/1.4/eapmd5pass-$VERSION.tgz -O eapmd5pass-$VERSION.tgz
tar xvf eapmd5pass-$VERSION.tgz
sudo rm -f eapmd5pass-$VERSION.tgz
sleep 2
cd $BINROOT
xterm -e "cd /opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass/eapmd5pass && make && exit; bash"

#make -j 4

chmod +x $REPOROOT/eapmd5pass/$EXECUTEABLE1
sudo rm -f /usr/local/bin/eapmd5pass
sudo ln -s $REPOROOT/eapmd5pass/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

#333d
CPDESKTFL
