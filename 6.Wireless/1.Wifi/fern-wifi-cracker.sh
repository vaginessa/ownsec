#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code
cd /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code
git clone https://github.com/savio-code/fern-wifi-cracker.sh

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker
EXECUTEABLE1=execute.py
EXECUTEABLE2=fern-wifi-cracker
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=fern-wifi-cracker.desktop

#
cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
echo "#!/bin/bash
cd /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker

python execute.py" > $EXECUTEABLE2
sudo chmod +x $EXECUTEABLE1
sudo chmod +x $EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
