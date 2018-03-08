#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/kismetwireless/kismet.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless
KISMETFILESDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/kismet/kismet-files
EXECUTEABLE1=beef.sh
EXECUTEABLE2=beef
#ph1b
CONFDIR=
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/kismet
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/kismet
DSKTPFL=kismet.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/kismet
#ph1a

echo "${bold}
 _  _____ ____  __  __ _____ _____ 
| |/ /_ _/ ___||  \/  | ____|_   _|
| ' / | |\___ \| |\/| |  _|   | |  
| . \ | | ___) | |  | | |___  | |  
|_|\_\___|____/|_|  |_|_____| |_|  
           
INSTALL
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then

sudo mv /usr/local/share/wireshark/manuf_old /usr/local/share/wireshark/manuf

sudo ldconfig
sudo updatedb
#

GITCLONEFUNC
sudo make suiduninstall
GITRESET
GITSBMDLINIT

./configure
make -j 4
sudo make suidinstall
#
mkdir -p /home/$USER/.kismet
echo "
#ssid_map" > /home/$USER/.kismet/ssid_map.conf
sudo mkdir -p /usr/share/wireshark/wireshark
sudo ln -s  /usr/local/share/wireshark/manuf /usr/share/wireshark/wireshark/manuf 

#rm -f kismet.sh
#echo "#!/bin/bash

#kismetadapter=(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | sed '/enp*/d' | sed '/docker*/d' | sed '/br*/d')
 
#cd /opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet


#./kismet -c $kismetadapter" > kismet.sh

# sed -i 's#=(#=$(#g' kismet.sh
# sed -i 's#-c #-c $kismetadapter#g' kismet.sh
#chmod +x kismet.sh

sudo rm -f $CONFDIR/kismet.conf
sudo cp $KISMETFILESDIR/kismet.conf $CONFDIR/kismet.conf
sudo ln -s $GITREPOROOT/kismet $BINDIR/kismet.sh

#sudo rm -f /usr/local/bin/kismet
sudo groupadd kismet
sudo usermod -a -G kismet $USER 
#newgrp kismet #newgrp bug lets the script hang

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

