#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/iax-flooder
BINROOT=/opt/ITSEC/10.Stresstest/iax-flooder/iaxflood
EXECUTEABLE1=iaxflood
EXECUTEABLE2=iaxflood

DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/iax-flooder
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/iax-flooder
DSKTPFL=iaxflood.desktop

echo "${bold}
 ___    _    __  _______ _     ___   ___  ____  _____ ____  
|_ _|  / \   \ \/ /  ___| |   / _ \ / _ \|  _ \| ____|  _ \ 
 | |  / _ \   \  /| |_  | |  | | | | | | | | | |  _| | |_) |
 | | / ___ \  /  \|  _| | |__| |_| | |_| | |_| | |___|  _ < 
|___/_/   \_\/_/\_\_|   |_____\___/ \___/|____/|_____|_| \_\
             
INSTALL
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/iax-flooder

cd $DOWNLOADDIR
sudo rm -f /usr/local/bin/$EXECUTEABLE2
wget http://www.hackingexposedvoip.com/tools/iaxflood.tar.gz -O iaxflood.tar.gz 
tar xvf iaxflood.tar.gz
cd iaxflood

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make

chmod +x $BINROOT/$EXECUTEABLE1
sudo ln -s $BINROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

#333d && CPDESKTFL