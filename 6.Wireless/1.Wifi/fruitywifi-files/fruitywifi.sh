#!/bin/bash

# CONFIG
version="2.4.1"
# --------------------------------------------------------
# Setup PHP version -> options: PHP5 | PHP7
# The chosen version needs to be in the repository
# --------------------------------------------------------
fruitywifi_php_version="PHP7"
# --------------------------------------------------------
# Setup log path. default=/usr/share/fruitywifi/logs
# --------------------------------------------------------
fruitywifi_log_path="/usr/share/fruitywifi/logs"
# --------------------------------------------------------
# --------------------------------------------------------
# FruityWiFi set defaults [init.d]
# --------------------------------------------------------
fruitywifi_init_defaults="onboot"
# --------------------------------------------------------

sudo find FruityWifi -type d -exec chmod 755 {} \;
sudo find FruityWifi -type f -exec chmod 644 {} \;

root_path=`/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi`

sudo mkdir tmp-install
cd tmp-install

sudo apt-get update

echo "--------------------------------"
echo "Creates user fruitywifi"
echo "--------------------------------"
sudo adduser --disabled-password --quiet --system --home /var/run/fruitywifi --no-create-home --gecos "FruityWiFi" --group fruitywifi
sudo usermod -a -G inet fruitywifi

echo "[fruitywifi user has been created]"
echo

sudo apt-get -y install gettext make intltool build-essential automake autoconf uuid uuid-dev dos2unix curl sudo unzip lsb-release python-scapy tcpdump python-netifaces python-pip git

sudo -H pip install netifaces

cmd=`gcc --version|grep "4.7"`
if [[ $cmd == "" ]]
then
    echo "--------------------------------"
    echo "Installing gcc 4.7"
    echo "--------------------------------"
	
    sudo apt-get -y install gcc-4.7
    sudo apt-get -y install g++-4.7
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 40 --slave /usr/bin/g++ g++ /usr/bin/g++-4.7
    
    echo "[gcc setup completed]"

else
    echo "--------------------------------"
    echo "gcc 4.7 already installed"
    echo "--------------------------------"
    echo
fi

echo

if [ ! -f "/usr/sbin/dnsmasq" ]
then
    echo "--------------------------------"
    echo "Installing dnsmasq"
    echo "--------------------------------"
	
    # INSTALL DNSMASQ
    sudo apt-get -y install dnsmasq
    
    echo "[dnsmasq setup completed]"

else
    echo "--------------------------------"
    echo "dnsmasq already installed"
    echo "--------------------------------"
    echo
fi

echo

if [ ! -f "/usr/sbin/hostapd" ]
then
    echo "--------------------------------"
    echo "Installing hostapd"
    echo "--------------------------------"

    # INSTALL HOSTAPD
    sudo apt-get -y install hostapd
    
    echo "[hostapd setup completed]"

else
    echo "--------------------------------"
    echo "hostapd already installed"
    echo "--------------------------------"
    echo
fi

echo

if [ ! -f "/usr/sbin/airmon-ng" ] &&  [ ! -f "/usr/local/sbin/airmon-ng" ]
then
    echo "--------------------------------"
    echo "Installing aircrack-ng"
    echo "--------------------------------"

    # INSTALL AIRCRACK-NG
    sudo apt-get -y install libssl-dev wireless-tools iw
	#VERSION="aircrack-ng-1.2-beta1" # [OLD_VERSION]
	VERSION="aircrack-ng-1.2-rc4"
    wget http://download.aircrack-ng.org/$VERSION.tar.gz
    tar -zxvf $VERSION.tar.gz
    cd $VERSION
    make
    make install
    sudo ln -s /usr/local/sbin/airmon-ng /usr/sbin/airmon-ng
    sudo ln -s /usr/local/sbin/airbase-ng /usr/sbin/airbase-ng
    cd ../
    
    echo "[aircrack-ng setup completed]"

else
    echo "--------------------------------"
    echo "aircrack-ng already installed"
    echo "--------------------------------"
    echo
fi

echo

# BACK TO ROOT-INSTALL FOLDER
cd $root_path

echo "--------------------------------"
echo "Installing Nginx"
echo "--------------------------------"

# NGINX INSTALL
echo -e "GBsomecitysomecompanysomesectionsomeserverY" | sudo apt-get -y install nginx
#echo -e "GBsomecitysomecompanysomesectionsomeserverY" | sudo apt-get -y install nginx php5-fpm
echo

# SSL
echo "--------------------------------"
echo "Create Nginx ssl certificate"
echo "--------------------------------"
cd $root_path
sudo mkdir /etc/nginx/ssl
echo -e "GBsomecitysomecompanysomesectionsomeserverY" | sudo openssl req  -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

# REMOVE DEFAULT SITE
sudo rm /etc/nginx/sites-enabled/default

# SETUP NGINX AND PHP5|PHP7
sudo cp $rootpath/nginx-setup/nginx.conf /etc/nginx/

if [[ $fruitywifi_php_version == "PHP7" ]]
then
	# INSTALL PHP7
	sudo apt-get -y install php7.0-fpm php7.0-curl php7.0-cli php7.0-xml
	
	sudo cp nginx-setup/FruityWiFi-PHP7 /etc/nginx/sites-enabled/
	sudo cp nginx-setup/fpm-PHP7/8000.conf /etc/php/7.0/fpm/pool.d/
	sudo cp nginx-setup/fpm-PHP7/8443.conf /etc/php/7.0/fpm/pool.d/
	
	# RESTART NGINX + PHP7-FPM
	sudo /etc/init.d/nginx restart
	sudo /etc/init.d/php7.0-fpm restart
else
	# INSTALL PHP5
	sudo apt-get -y install php5-fpm php5-curl php5-cli
	
	sudo cp nginx-setup/FruityWifi /etc/nginx/sites-enabled/
	sudo cp nginx-setup/fpm/8000.conf /etc/php5/fpm/pool.d/
	sudo cp nginx-setup/fpm/8443.conf /etc/php5/fpm/pool.d/
	
	# RESTART NGINX + PHP5-FPM
	sudo /etc/init.d/nginx restart
	sudo /etc/init.d/php5-fpm restart
fi

echo "[nginx setup completed]"
echo

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
cd $root_path
echo

echo "--------------------------------"
echo "Config log path"
echo "--------------------------------"

EXEC="s,^\$log_path=.*,\$log_path=\""$fruitywifi_log_path"\";,g"
sudo sed -i "$EXEC" $rootpath/FruityWifi/www/config/config.php
EXEC="s,^log-facility=.*,log-facility="$fruitywifi_log_path"/dnsmasq.log,g"
sudo sed -i "$EXEC" $rootpath/FruityWifi/conf/dnsmasq.conf
EXEC="s,^dhcp-leasefile=.*,dhcp-leasefile="$fruitywifi_log_path"/dhcp.leases,g"
sudo sed -i "$EXEC" $rootpath/FruityWifi/conf/dnsmasq.conf
EXEC="s,^Defaults:fruitywifi logfile =.*,Defaults:fruitywifi logfile = "$fruitywifi_log_path"/sudo.log,g"
sudo sed -i "$EXEC" $rootpath/sudo-setup/fruitywifi

echo "[logs setup completed]"
echo

echo "--------------------------------"
echo "Setup Sudo"
echo "--------------------------------"
cd $root_path
sudo cp -a sudo-setup/fruitywifi /etc/sudoers.d/
sudo chown root:root /etc/sudoers.d/fruitywifi

echo "[sudo setup completed]"
echo

cmd=`lsb_release -c |grep -iEe "jessie|kali|sana"`
if [[ ! -z $cmd ]]
then
    echo "--------------------------------"
    echo "Setup DNSMASQ"
    echo "--------------------------------"
	
    EXEC="s,^server=,#server=,g"
    sudo sed -i $EXEC FruityWifi/conf/dnsmasq.conf
    
    echo "[dnsmasq setup completed]"
    echo

fi

sudo cp -a FruityWifi /usr/share/fruitywifi
#sudo mkdir $fruitywifi_log_path
sudo ln -s $fruitywifi_log_path /usr/share/fruitywifi/www/logs

echo

# START/STOP SERVICES
if [[ $fruitywifi_init_defaults == "onboot" ]]
then
	echo "--------------------------------"
	echo "START SERVICES"
	echo "--------------------------------"
	
	sudo update-rc.d ssh defaults
	sudo update-rc.d nginx defaults
	sudo update-rc.d ntp defaults
	
	sudo /etc/init.d/nginx restart
	if [[ $fruitywifi_php_version == "PHP7" ]]
	then
		sudo update-rc.d php7.0-fpm defaults
		sudo /etc/init.d/php7.0-fpm restart
	else
		sudo update-rc.d php5-fpm defaults
		sudo /etc/init.d/php5-fpm restart
	fi	
fi

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
echo "ENJOY!"
echo ""
