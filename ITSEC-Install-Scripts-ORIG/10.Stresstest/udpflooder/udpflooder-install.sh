#!/bin/bash

#http://www.hackingvoip.com/sec_tools.html

#http://www.hackingvoip.com/tools/udpflood.tar.gz

bold=$(tput bold)
normal=$(tput sgr0)

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/udp-flooder
BINROOT=/opt/ITSEC/10.Stresstest/udp-flooder/udpflood
#EXECUTEABLE1=pig.py
#EXECUTEABLE2=pig
EXECUTEABLE1=udpflood
EXECUTEABLE2=udpflood

DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/udp-flooder
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/udp-flooder
DSKTPFL=udpflood.desktop

echo "${bold}
 _   _ ____  ____  _____ _     ___   ___  ____  _____ ____  
| | | |  _ \|  _ \|  ___| |   / _ \ / _ \|  _ \| ____|  _ \ 
| | | | | | | |_) | |_  | |  | | | | | | | | | |  _| | |_) |
| |_| | |_| |  __/|  _| | |__| |_| | |_| | |_| | |___|  _ < 
 \___/|____/|_|   |_|   |_____\___/ \___/|____/|_____|_| \_\
           
INSTALL
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/udp-flooder
cd $DOWNLOADDIR

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig

wget http://www.hackingexposedvoip.com/tools/udpflood.tar.gz -O udpflood.tar.gz 
tar xvf udpflood.tar.gz
cd udpflood
make
#chmod +x $GITREPOROOT/$EXECUTEABLE1
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

chmod +x $BINROOT/$EXECUTEABLE1
sudo ln -s $BINROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL