#!/bin/bash

# INSTALL LAST

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/xtr4nge/FruityWifi.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge
EXECUTEABLE1=fruitywifi.sh
EXECUTEABLE2=fruitywifi
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/fruitywifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/fruitywifi
DSKTPFL=fruity-wifi.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/fruitywifi
#ph1a

echo "${bold}
 _____ ____  _   _ ___ _______   ____        _____ _____ ___ 
|  ___|  _ \| | | |_ _|_   _\ \ / /\ \      / /_ _|  ___|_ _|
| |_  | |_) | | | || |  | |  \ V /  \ \ /\ / / | || |_   | | 
|  _| |  _ <| |_| || |  | |   | |    \ V  V /  | ||  _|  | | 
|_|   |_| \_\\___/|___| |_|   |_|     \_/\_/  |___|_|   |___|
        
UPDATE
${normal}"
GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT

sudo systemctl enable dnsmasq.service 
sed -i 's#/usr/share/fruitywifi/logs#/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi/FruityWifi/logs/#g' install-FruityWiFi-PHP7.sh
sed -i 's/pip install netifaces/sudo -H pip install netifaces/g' install-FruityWiFi-PHP7.sh
sed -i 's/apt-get /sudo apt-get /g' install-FruityWiFi-PHP7.sh
sed -i 's#rm /#sudo rm /#g' install-FruityWiFi-PHP7.sh
sed -i 's#update-alternatives#sudo update-alternatives#g' install-FruityWiFi-PHP7.sh
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
sed -i 's#root_path=`pwd`#root_path=/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi#g' install-FruityWiFi-PHP7.sh
#sed -i 's#sudo apt-get -y install nginx#echo -e "GB\somecity\somecompany\somesection\someserver\Y" | sudo apt-get -y install nginx#g' install-FruityWiFi-PHP7.sh
sed -i 's#sudo apt-get -y install nginx#yes "GB" | sudo apt-get -y install nginx#g' install-FruityWiFi-PHP7.sh

#sed -i 's#sudo openssl req#echo -e "GB\somecity\somecompany\somesection\someserver\Y" | sudo openssl req #g' install-FruityWiFi-PHP7.sh
sed -i 's#sudo openssl req#yes "GB" | sudo openssl req #g' install-FruityWiFi-PHP7.sh

sed -i 's#/usr/share/fruitywifi/www#/opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi/FruityWifi/www/#g' nginx-setup/FruityWiFi-PHP7


./install-FruityWiFi-PHP7.sh


echo "!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/fruitywifi/xtr4nge/FruityWifi
sudo nginx_start.sh
sudo php7.0-fpm_start.sh
firefox https://localhost:8443 </dev/null &>/dev/null &" > $EXECUTEABLE1
CHMODXEX1

SYMLINKEX2TO1

#333d 
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


