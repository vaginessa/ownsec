#!/bin/bash

sudo chown -R $USER/$USER /home/$USER
sudo chown -R $USER/$USER /opt
cp -R /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.config /home/$USER
mkdir -p /home/$USER/.local/share/applications/0.Services
cp -R /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/0.Services/ /home/$USER/.local/share/applications/

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/Services
DSKTPFLSDEST=/home/$USER/.local/share/applications/Services
DSKTPFL=phpmyadmin.desktop
sudo rm -f /etc/phpmyadmin/phpmyadmin.desktop
sudo rm -f  /usr/share/applications/phpmyadmin.desktop
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


sudo rm -f /usr/local/bin/LAMP_*
sudo rm -f /usr/local/bin/LAPP_*
sudo rm -f /usr/local/bin/apache2_*
sudo rm -f /usr/local/bin/lighttpd_*
sudo rm -f /usr/local/bin/nginx_*
sudo rm -f /usr/local/bin/mysql_*
sudo rm -f /usr/local/bin/postgresql_*
sudo rm -f /usr/local/bin/redis-server_*
sudo rm -f /usr/local/bin/php7.0-fpm_*
sudo rm -f /usr/local/bin/php7.0-fpm_*
sudo rm -f /usr/local/bin/php7.0-fpm_*

cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/0.LAMP/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/0.LAMP/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/0.LAPP/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/0.LAPP/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/1.APACHE2/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/1.APACHE2/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/1.LIGHTTPD/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/1.LIGHTTPD/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/1.NGINX/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/1.NGINX/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/2.MYSQL/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/2.MYSQL/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/2.PSQL/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/2.PSQL/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/2.REDIS/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/2.REDIS/$SHfiles /usr/local/bin/$SHfiles;done'
cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/3.PHP/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/3.PHP/$SHfiles /usr/local/bin/$SHfiles;done'


cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/$SHfiles /usr/local/bin/$SHfiles;done'

