#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ITSEC-Install-Scripts
SETTINGSCRIPTS=/0.Initial/settings-scripts
BINDIR=/usr/local/bin
XFCEMNUFLS=.local/share/applications

echo "${bold}
USR ENV PT1         
${normal}"


## SERVICE symlinks
echo "${bold}
... Symlink Services ....         
${normal}"

sudo rm -f $BINDIR/LAMP_*
sudo rm -f $BINDIR/LAPP_*
sudo rm -f $BINDIR/apache2_*
sudo rm -f $BINDIR/lighttpd_*
sudo rm -f $BINDIR/nginx_*
sudo rm -f $BINDIR/mysql_*
sudo rm -f $BINDIR/postgresql_*
sudo rm -f $BINDIR/redis-server_*
sudo rm -f $BINDIR/php7.0-fpm_*
sudo rm -f $BINDIR/php7.0-fpm_*
sudo rm -f $BINDIR/php7.0-fpm_*

cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/0.LAMP
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/0.LAMP/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/0.LAPP
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/0.LAPP/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/1.APACHE2
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/1.APACHE2/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/1.LIGHTTPD
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/1.LIGHTTPD/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/1.NGINX
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/1.NGINX/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/2.MYSQL
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/2.MYSQL/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/2.PSQL
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/2.PSQL/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/2.REDIS
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/2.REDIS/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/3.PHP
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/3.PHP/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/3.DNS
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/3.DNS/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/4.TOR
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/4.TOR/$SHfiles $BINDIR/$SHfiles;done'
cd $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/6.Docker
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/$SETTINGSCRIPTS/startstop/0.Services/6.Docker/$SHfiles $BINDIR/$SHfiles;done'

# script to copy and reload xfce configs from 
sudo ln -s $REPOROOT/$SETTINGSCRIPTS/this-repo/SCRIPT_copy-XFCE-conf.sh $BINDIR/SCRIPT_copy-XFCE-conf

# UPDATE script symlinks
sudo rm -f $BINDIR/updateallthegits.sh
sudo rm -f $BINDIR/upgrade-os.sh
cd $REPOROOT/00.Maintain
sudo ln -s $REPOROOT/00.Maintain/updateallthegits.sh $BINDIR/updateallthegits.sh
cd $REPOROOT/00.Maintain
sudo ln -s $REPOROOT/00.Maintain/upgrade-os.sh $BINDIR/upgrade-os.sh


# XFCE menu links
echo "${bold}
... Create XFCE Menu Entries for Services ....         
${normal}"
mkdir -p /home/$USER/$XFCEMNUFLS/0.Services
cp -R $REPOROOT/0.Initial/usrlcl/$XFCEMNUFLS/0.Services /home/$USER/$XFCEMNUFLS
mkdir -p /home/$USER/$XFCEMNUFLS/00.Scripts
cp -R $REPOROOT/0.Initial/usrlcl/$XFCEMNUFLS/00.Scripts /home/$USER/$XFCEMNUFLS



