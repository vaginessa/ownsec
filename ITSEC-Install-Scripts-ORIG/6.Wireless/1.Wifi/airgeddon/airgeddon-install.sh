#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/v1s1t0r1sh3r3/airgeddon
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3
EXECUTEABLE1=airgeddon_run.sh
EXECUTEABLE2=airgeddon
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/airgeddon
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/airgeddon
DSKTPFL=airgeddon.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/airgeddon
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    ___ ____   ____ _____ ____  ____   ___  _   _ 
   / \  |_ _|  _ \ / ___| ____|  _ \|  _ \ / _ \| \ | |
  / _ \  | || |_) | |  _|  _| | | | | | | | | | |  \| |
 / ___ \ | ||  _ <| |_| | |___| |_| | |_| | |_| | |\  |
/_/   \_\___|_| \_\\____|_____|____/|____/ \___/|_| \_|
             
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

echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
sudo ./airgeddon.sh "$@"' > $EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
