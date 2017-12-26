#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ITSEC-Install-Scripts
SETTINGSCRIPTS=0.Initial/settings-scripts
BINDIR=/usr/local/bin
XFCEMNUFLS=.local/share/applications

echo "${bold}
USR ENV PT1         
${normal}"


## SERVICE symlinks
echo "${bold}
... Symlink Services ....         
${normal}"

sudo updatedb

#delete symlinks created by mistake
sudo rm -f /LAMP_*
sudo rm -f /LAPP_*
sudo rm -f /apache2_*
sudo rm -f /lighttpd_*
sudo rm -f /nginx_*
sudo rm -f /mysql_*
sudo rm -f /postgresql_*
sudo rm -f /redis-server_*
sudo rm -f /php7.0-fpm_*
sudo rm -f /dnsmasq_*
sudo rm -f /conky_*

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services
for SHfiles in $(ls *.sh)
do 
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/$SHfiles /usr/local/bin/$SHfiles 
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/0.LAMP
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/0.LAMP/$SHfiles /usr/local/bin/$SHfiles 
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/0.LAPP
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/0.LAPP/$SHfiles /usr/local/bin/$SHfiles 
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/1.APACHE2
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/1.APACHE2/$SHfiles /usr/local/bin/$SHfiles
done

echo "test"

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/1.LIGHTTPD
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/1.LIGHTTPD/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/1.NGINX
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/1.NGINX/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/2.MYSQL
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/2.MYSQL/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/2.PSQL
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/2.PSQL/$SHfiles /usr/local/bin/$SHfiles
done

echo "test2"
cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/2.REDIS
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/2.REDIS/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/3.PHP
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/3.PHP/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/3.DNS
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/3.DNS/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/4.TOR
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/4.TOR/$SHfiles /usr/local/bin/$SHfiles
done

echo "test3"
cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/5.Conky
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/5.Conky/$SHfiles /usr/local/bin/$SHfiles
done
echo "test3s"
cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/6.Docker
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/6.Docker/$SHfiles /usr/local/bin/$SHfiles
done

echo "test4"
cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/7.Print-Scan
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/7.Print-Scan/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/8.Bluetooth
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/8.Bluetooth/$SHfiles /usr/local/bin/$SHfiles
done

cd /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/9.GPS
for SHfiles in $(ls *.sh)
do
sudo rm -f /usr/local/bin/$SHfiles
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/startstop/0.Services/9.GPS/$SHfiles /usr/local/bin/$SHfiles
done



# script to copy and reload xfce configs from
sudo rm -f /usr/local/bin/SCRIPT_copy-XFCE-conf
sudo ln -s /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/this-repo/SCRIPT_copy-XFCE-conf.sh /usr/local/bin/SCRIPT_copy-XFCE-conf

# UPDATE script symlinks
sudo rm -f /usr/local/bin/updateallthegits.sh
sudo rm -f /usr/local/bin/upgrade-os.sh
cd /opt/ITSEC-Install-Scripts/00.Maintain
sudo ln -s /opt/ITSEC-Install-Scripts/00.Maintain/updateallthegits.sh /usr/local/bin/updateallthegits.sh
cd /opt/ITSEC-Install-Scripts/00.Maintain
sudo ln -s /opt/ITSEC-Install-Scripts/00.Maintain/upgrade-os.sh /usr/local/bin/upgrade-os.sh


# XFCE menu links
echo "${bold}
... Create XFCE Menu Entries for Services ....         
${normal}"

mkdir -p /home/$USER/$XFCEMNUFLS/0.Services
cp -R /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/$XFCEMNUFLS/0.Services /home/$USER/$XFCEMNUFLS
mkdir -p /home/$USER/$XFCEMNUFLS/00.Scripts
cp -R /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/$XFCEMNUFLS/00.Scripts /home/$USER/$XFCEMNUFLS

sudo updatedb
sudo ldconfig