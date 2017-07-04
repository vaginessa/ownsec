#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _  _____ ____  __  __ _____ _____ 
| |/ /_ _/ ___||  \/  | ____|_   _|
| ' / | |\___ \| |\/| |  _|   | |  
| . \ | | ___) | |  | | |___  | |  
|_|\_\___|____/|_|  |_|_____| |_|  
           
${normal}"


mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless
cd /opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless
git clone https://github.com/kismetwireless/kismet.git
#

sudo mv /usr/local/share/wireshark/manuf_old /usr/local/share/wireshark/manuf

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=kismet.desktop
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
./configure
make -j 4
sudo make suidinstall
#
mkdir -p /home/$USER/.kismet
echo "
#ssid_map" >> /home/$USER/.kismet/ssid_map.conf
sudo mkdir -p /usr/share/wireshark/wireshark
sudo ln -s  /usr/local/share/wireshark/manuf /usr/share/wireshark/wireshark/manuf 

rm -f kismet.sh
#echo "#!/bin/bash

#kismetadapter=(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | sed '/enp*/d' | sed '/docker*/d' | sed '/br*/d')
 
#cd /opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet


#./kismet -c $kismetadapter" > kismet.sh

# sed -i 's#=(#=$(#g' kismet.sh
# sed -i 's#-c #-c $kismetadapter#g' kismet.sh
#chmod +x kismet.sh

sudo rm /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/kismet-files/kismet.conf
sudo cp /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/kismet-files/kismet.conf /usr/local/etc/kismet.conf
sudo ln -s /opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet/kismet /usr/local/bin/kismet.sh

#sudo rm -f /usr/local/bin/kismet
sudo groupadd kismet
sudo usermod -a -G kismet $USER 
#newgrp kismet #newgrp bug lets the script hang
