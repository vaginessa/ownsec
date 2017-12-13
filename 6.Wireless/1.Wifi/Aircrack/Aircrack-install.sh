#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Ethical-H4CK3R/Aircrack
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R
EXECUTEABLE1=aircrack.sh
EXECUTEABLE2=aircrack
EXECUTEABLE3=aircrack.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=aircrack.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    _                         _    
   / \  (_)_ __ ___ _ __ __ _  ___| | __
  / _ \ | | '__/ __| '__/ _  |/ __| |/ /
 / ___ \| | | | (__| | | (_| | (__|   < 
/_/   \_\_|_|  \___|_|  \__ _|\___|_|\_\
       
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# aircrack-ng
### DEPS END

GITSBMDLINIT
#sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig

echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack

sudo python aircrack.py "$@"' > $EXECUTEABLE1

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
