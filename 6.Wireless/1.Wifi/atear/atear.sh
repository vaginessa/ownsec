#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _  _____ _____    _    ____  
   / \|_   _| ____|  / \  |  _ \ 
  / _ \ | | |  _|   / _ \ | |_) |
 / ___ \| | | |___ / ___ \|  _ < 
/_/   \_\_| |_____/_/   \_\_| \_\
           
${normal}"

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc
cd /opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc
git clone https://github.com/NORMA-Inc/AtEar.git


sudo rm /usr/local/bin/atear

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar
EXECUTEABLE1=run.py
EXECUTEABLE2=atear
EXECUTEABLE3=atear.sh

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=atear.desktop

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
#

rm -f $EXECUTEABLE3
echo "#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar 
firefox 127.0.0.1:8080 </dev/null &>/dev/null &
sudo python run.py --iface wlan0" > $EXECUTEABLE3

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
