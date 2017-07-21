#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _     _____ _   _ _   _ ____  ____  _   _ _  _______ 
| | | | |   |  ___| | | | \ | |  _ \/ ___|| | | | |/ / ____|
| |_| | |   | |_  | |_| |  \| | | | \___ \| |_| | ' /|  _|  
|  _  | |___|  _| |  _  | |\  | |_| |___) |  _  | . \| |___ 
|_| |_|_____|_|   |_| |_|_| \_|____/|____/|_| |_|_|\_\_____|
                                                           
${normal}"
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack
GITREPOGITFILE=$GITREPOROOT/.git

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=wpa2-halfhandshake-crack.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481
cd /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481
git clone https://github.com/dxa4481/WPA2-HalfHandshake-Crack

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack
sudo python setup.py install

rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

rm -f halfHandshake.sh
echo '#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack/

python halfHandshake.py "$@" ' > halfHandshake.sh

chmod +x halfHandshake.py

chmod +x halfHandshake.sh
sudo rm -f /usr/local/bin/halfHandshake
sudo ln -s /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack/halfHandshake.sh /usr/local/bin/halfHandshake
fi

