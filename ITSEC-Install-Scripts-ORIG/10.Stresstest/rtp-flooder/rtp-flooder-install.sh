#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/rtp-flooder
BINROOT=/opt/ITSEC/10.Stresstest/rtp-flooder/rtpflood

EXECUTEABLE1=rtpflood
EXECUTEABLE2=rtpflood
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/rtp-flooder
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/rtp-flooder
DSKTPFL=rtpflood.desktop

echo "${bold}
 ____ _____ ____  _____ _     ___   ___  ____  _____ ____  
|  _ \_   _|  _ \|  ___| |   / _ \ / _ \|  _ \| ____|  _ \ 
| |_) || | | |_) | |_  | |  | | | | | | | | | |  _| | |_) |
|  _ < | | |  __/|  _| | |__| |_| | |_| | |_| | |___|  _ < 
|_| \_\|_| |_|   |_|   |_____\___/ \___/|____/|_____|_| \_\
              
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/rtp-flooder


cd $DOWNLOADDIR

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig

wget http://www.hackingvoip.com/tools/rtpflood.tar.gz -O rtpflood.tar.gz 
tar xvf rtpflood.tar.gz
cd rtpflood
make

chmod +x $BINROOT/$EXECUTEABLE1
sudo ln -s $BINROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL