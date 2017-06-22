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
#sudo ./install-FruityWiFi-PHP7.sh

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

find FruityWifi -type d -exec chmod 755 {} \;
find FruityWifi -type f -exec chmod 644 {} \;

mkdir tmp-install
cd tmp-install

sudo adduser --disabled-password --quiet --system --home /var/run/fruitywifi --no-create-home --gecos "FruityWiFi" --group fruitywifi
sudo usermod -a -G inet fruitywifi

sudo -H pip install netifaces

DIR="/usr/share/fruitywifi"
if [ -d "$DIR" ]; then
	echo "--------------------------------"
	echo "BACKUP CORE AND MODULES"
	echo "--------------------------------"
	cmd=`date +"%Y-%m-%d-%H-%M-%S"`
	mv $DIR fruitywifi.BAK.$cmd	
	echo
fi

echo "--------------------------------"
echo "Setup FruityWiFi"
echo "--------------------------------"
cd $GITREPOROOT 
echo

echo "--------------------------------"
echo "Config log path"
echo "--------------------------------"

EXEC="s,^\$log_path=.*,\$log_path=\""$fruitywifi_log_path"\";,g"
sed -i "$EXEC" FruityWifi/www/config/config.php
EXEC="s,^log-facility=.*,log-facility="$fruitywifi_log_path"/dnsmasq.log,g"
sed -i "$EXEC" FruityWifi/conf/dnsmasq.conf
EXEC="s,^dhcp-leasefile=.*,dhcp-leasefile="$fruitywifi_log_path"/dhcp.leases,g"
sed -i "$EXEC" FruityWifi/conf/dnsmasq.conf
EXEC="s,^Defaults:fruitywifi logfile =.*,Defaults:fruitywifi logfile = "$fruitywifi_log_path"/sudo.log,g"
sed -i "$EXEC" sudo-setup/fruitywifi

echo "[logs setup completed]"
echo

echo "--------------------------------"
echo "Setup Sudo"
echo "--------------------------------"
cd $GITREPOROOT 
sudo cp -a sudo-setup/fruitywifi /etc/sudoers.d/
sudo chown root:root /etc/sudoers.d/fruitywifi

echo "[sudo setup completed]"
echo


sudo cp -a FruityWifi /usr/share/fruitywifi
#mkdir $fruitywifi_log_path
ln -s $fruitywifi_log_path /usr/share/fruitywifi/www/logs



sudo apt-get -y remove ifplugd

echo
echo "---------------------------"
echo "WEB-INTERFACE"
echo "---------------------------"
echo "http://localhost:8000 [http]"
echo "https://localhost:8443 [https]"
echo "user: admin"
echo "pass: admin"
echo
echo "GitHub: https://github.com/xtr4nge/FruityWifi"
echo "Twitter: @xtr4nge, @FruityWifi"


