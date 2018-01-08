#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/d4rkcat/HandShaker
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat
EXECUTEABLE1=handshaker_autowlan.sh
EXECUTEABLE2=handshaker_autowlan
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=handshaker.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _    _    _   _ ____  ____  _   _    _    _  _______ ____  
| | | |  / \  | \ | |  _ \/ ___|| | | |  / \  | |/ / ____|  _ \ 
| |_| | / _ \ |  \| | | | \___ \| |_| | / _ \ | ' /|  _| | |_) |
|  _  |/ ___ \| |\  | |_| |___) |  _  |/ ___ \| . \| |___|  _ < 
|_| |_/_/   \_\_| \_|____/|____/|_| |_/_/   \_\_|\_\_____|_| \_\
             
INSTALL   
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
sudo make -j 4

echo '#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/handshaker/d4rkcat/HandShaker

sudo ./handshaker.sh -i wlan0 -i2 wlan1 "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL



