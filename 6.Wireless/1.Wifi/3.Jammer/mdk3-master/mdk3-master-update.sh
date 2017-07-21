#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __ ____  _  _______       __  __    _    ____ _____ _____ ____  
|  \/  |  _ \| |/ /___ /      |  \/  |  / \  / ___|_   _| ____|  _ \ 
| |\/| | | | | ' /  |_ \ _____| |\/| | / _ \ \___ \ | | |  _| | |_) |
| |  | | |_| | . \ ___) |_____| |  | |/ ___ \ ___) || | | |___|  _ < 
|_|  |_|____/|_|\_\____/      |_|  |_/_/   \_\____/ |_| |_____|_| \_\
                  
${normal}"

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony/mdk3-master
GITREPOGITFILE=$GITREPOROOT/.git
#cd /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/wi-fi-analyzer/mdk3-master/

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFL=mdk3-master.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony
cd /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/mdk3-master/camerony
git clone https://github.com/camerony/mdk3-master.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

