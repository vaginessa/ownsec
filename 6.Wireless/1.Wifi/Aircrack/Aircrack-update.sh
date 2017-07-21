#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    _                         _    
   / \  (_)_ __ ___ _ __ __ _  ___| | __
  / _ \ | | '__/ __| '__/ _  |/ __| |/ /
 / ___ \| | | | (__| | | (_| | (__|   < 
/_/   \_\_|_|  \___|_|  \__ _|\___|_|\_\
       
${normal}"

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=aircrack.py
EXECUTEABLE2=aircrack
EXECUTEABLE3=aircrack.sh

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=aircrack.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R
cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R
git clone https://github.com/Ethical-H4CK3R/Aircrack

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


sudo rm /usr/local/bin/aircrack
sudo rm -f /usr/local/bin/$EXECUTEABLE2

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
sudo -H pip2 install -r requirements.txt

rm -f $EXECUTEABLE3
echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack

sudo python aircrack.py "$@"' > $EXECUTEABLE3

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
