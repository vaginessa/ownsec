#!/bin/bash

# INSTALL LAST

#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=fruity-wifi.desktop


mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge
cd /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge
git clone https://github.com/xtr4nge/FruityWifi.git
#


cd /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi/
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
sudo ./install-FruityWiFi-PHP7.sh

sudo /etc/init.d/nginx restart

echo "’!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi
sudo nginx_start.sh
php7.0-fpm_start.sh
sensible-browser https://localhost:8443
" >> fruitywifi.sh
chmod +x fruitywifi.sh
sudo ln -s /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi/fruitywifi.sh /usr/local/bin/fruitywify
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

