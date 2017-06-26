#!/bin/bash

# INSTALL LAST


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ____  _   _ ___ _______   ____        _____ _____ ___ 
|  ___|  _ \| | | |_ _|_   _\ \ / /\ \      / /_ _|  ___|_ _|
| |_  | |_) | | | || |  | |  \ V /  \ \ /\ / / | || |_   | | 
|  _| |  _ <| |_| || |  | |   | |    \ V  V /  | ||  _|  | | 
|_|   |_| \_\\___/|___| |_|   |_|     \_/\_/  |___|_|   |___|
        
${normal}"

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=fruity-wifi.desktop

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge
cd /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge
git clone https://github.com/xtr4nge/FruityWifi.git




version="2.4.1"
fruitywifi_php_version="PHP7"
fruitywifi_log_path="/usr/share/fruitywifi/logs"
fruitywifi_init_defaults="onboot"

cd $GITREPOROOT 
git clean -f 
git fetch origin
git reset --hard origin/master
git pull


sed -i 's/pip install netifaces/sudo -H pip install netifaces/g' install-FruityWiFi-PHP7.sh
sed -i 's/apt-get /sudo apt-get /g' install-FruityWiFi-PHP7.sh
sed -i 's#rm /#sudo rm /#g' install-FruityWiFi-PHP7.sh
sed -i 's#cp #sudo cp #g' install-FruityWiFi-PHP7.sh
sed -i 's#chown #sudo chown #g' install-FruityWiFi-PHP7.sh
sed -i 's#sed #sudo sed #g' install-FruityWiFi-PHP7.sh
sed -i 's#openssl #sudo openssl #g' install-FruityWiFi-PHP7.sh
sed -i 's#mkdir #sudo mkdir #g' install-FruityWiFi-PHP7.sh
sed -i 's#find #sudo find #g' install-FruityWiFi-PHP7.sh
sed -i 's#update-rc.d#sudo update-rc.d#g' install-FruityWiFi-PHP7.sh
sed -i 's#/etc/init.d#sudo /etc/init.d#g' install-FruityWiFi-PHP7.sh
sed -i 's#ln -s#sudo ln -s#g' install-FruityWiFi-PHP7.sh
sed -i 's#adduser#sudo adduser#g' install-FruityWiFi-PHP7.sh
sed -i 's#usermod#sudo usermod#g' install-FruityWiFi-PHP7.sh
./install-FruityWiFi-PHP7.sh

echo "!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi
sudo nginx_start.sh
php7.0-fpm_start.sh
sensible-browser https://localhost:8443
" >> fruitywifi.sh
chmod +x fruitywifi.sh
sudo ln -s /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi/fruitywifi.sh /usr/local/bin/fruitywify
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

