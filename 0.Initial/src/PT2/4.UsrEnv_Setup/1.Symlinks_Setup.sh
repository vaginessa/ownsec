#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ownsec
SETTINGSCRIPTS=/opt/ownsec/0.Initial/settings-scripts/startstop/0.Services
BINDIR=/usr/local/bin
XFCEMNUFLS=.local/share/applications

echo "${bold}
USR ENV PT1         
${normal}"


## services symlinks
echo "${bold}
... Symlink services ....         
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

echo "# Symlinks for mixed start stop update scripts in 0.Services menu"
cd $SETTINGSCRIPTS
for SHfiles in $(ls *.sh)
do 
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/$SHfiles $BINDIR/$SHfiles 
done

echo "# Symlinks for the LAMP stack services Scripts"
cd $SETTINGSCRIPTS/0.LAMP
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/0.LAMP/$SHfiles $BINDIR/$SHfiles 
done

echo "# Symlinks for the LAPP stack services Scripts"
cd $SETTINGSCRIPTS/0.LAPP
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/0.LAPP/$SHfiles $BINDIR/$SHfiles 
done

echo "# Symlinks for the apache2 services Scripts"
cd $SETTINGSCRIPTS/1.APACHE2
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/1.APACHE2/$SHfiles $BINDIR/$SHfiles
done


echo "# Symlinks for the lighttpd services Scripts"
cd $SETTINGSCRIPTS/1.LIGHTTPD
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/1.LIGHTTPD/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the nginx services Scripts"
cd $SETTINGSCRIPTS/1.NGINX
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/1.NGINX/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the mysql services Scripts"
cd $SETTINGSCRIPTS/2.MYSQL
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/2.MYSQL/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the psql services Scripts"
cd $SETTINGSCRIPTS/2.PSQL
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/2.PSQL/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the redis services Scripts"
cd $SETTINGSCRIPTS/2.REDIS
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/2.REDIS/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the php services Scripts"
cd $SETTINGSCRIPTS/3.PHP
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/3.PHP/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the dns services Scripts"
cd $SETTINGSCRIPTS/3.DNS
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/3.DNS/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the tor services Scripts"
cd $SETTINGSCRIPTS/4.TOR
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/4.TOR/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the conky services Scripts"
cd $SETTINGSCRIPTS/5.Conky
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/5.Conky/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the docker services Scripts"
cd $SETTINGSCRIPTS/6.Docker
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/6.Docker/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the print & scan services Scripts"
cd $SETTINGSCRIPTS/7.Print-Scan
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/7.Print-Scan/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the bluetooth services Scripts"
cd $SETTINGSCRIPTS/8.Bluetooth
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/8.Bluetooth/$SHfiles $BINDIR/$SHfiles
done

echo "# Symlinks for the gps services Scripts"
cd $SETTINGSCRIPTS/9.GPS
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo ln -s $SETTINGSCRIPTS/9.GPS/$SHfiles $BINDIR/$SHfiles
done



echo "# Symlink script to copy and reload xfce configs"
sudo rm -f $BINDIR/SCRIPT_copy-XFCE-conf
sudo ln -s /opt/ownsec/0.Initial/settings-scripts/this-repo/SCRIPT_copy-XFCE-conf.sh $BINDIR/SCRIPT_copy-XFCE-conf

echo "# Symlinks for update-scripts"
sudo rm -f $BINDIR/updateallthegits.sh
sudo rm -f $BINDIR/upgrade-os.sh
cd /opt/ownsec/00.Maintain
sudo ln -s /opt/ownsec/00.Maintain/updateallthegits.sh $BINDIR/updateallthegits.sh
cd /opt/ownsec/00.Maintain
sudo ln -s /opt/ownsec/00.Maintain/upgrade-os.sh $BINDIR/upgrade-os.sh


echo "# XFCE menu links"
echo "${bold}
... Create XFCE Menu Entries for services ....         
${normal}"

mkdir -p /home/$USER/$XFCEMNUFLS/0.Services
cp -R /opt/ownsec/0.Initial/usrlcl/$XFCEMNUFLS/0.Services /home/$USER/$XFCEMNUFLS
mkdir -p /home/$USER/$XFCEMNUFLS/00.Scripts
cp -R /opt/ownsec/0.Initial/usrlcl/$XFCEMNUFLS/00.Scripts /home/$USER/$XFCEMNUFLS

echo "# Finish Symlink Setup :)"
sudo updatedb
sudo ldconfig