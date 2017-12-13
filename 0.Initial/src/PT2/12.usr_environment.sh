#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ITSEC-Install-Scripts
SETTINGSCRIPTS=/0.Initial/settings-scripts
$BINDIR=/usr/local/bin

DSKTPFLS=$REPOROOT/0.Initial/usrlcl/.local/share/applications/Services
DSKTPFLSDEST=/home/$USER/.local/share/applications/Services
DSKTPFL=phpmyadmin.desktop

echo "${bold}
USR ENV PT1         
${normal}"


echo "${bold}
... copy Menu and Panel Setup ....         
${normal}"
cp -R $REPOROOT/0.Initial/usrlcl/.config /home/$USER
mkdir -p /home/$USER/.local/share/applications/0.Services
cp -R $REPOROOT/0.Initial/usrlcl/.local/share/applications/0.Services/ /home/$USER/.local/share/applications
mkdir -p /home/$USER/.local/share/applications/00.Scripts
cp -R $REPOROOT/0.Initial/usrlcl/.local/share/applications/00.Scripts/ /home/$USER/.local/share/applications



#sudo rm -f /etc/phpmyadmin/phpmyadmin.desktop
#sudo rm -f  /usr/share/applications/phpmyadmin.desktop
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

## SERVICE symlinks
echo "${bold}
... Symlink Service Shortcuts ....         
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


sudo ln -s $REPOROOT/$SETTINGSCRIPTS/this-repo/cp-conf.sh $BINDIR/ITsec-Install-Scripts_cp-conf

# UPDATE script symlinks
sudo rm -f $BINDIR/updateallthegits.sh
sudo rm -f $BINDIR/upgrade-os.sh
cd $REPOROOT/00.Maintain
sudo ln -s $REPOROOT/00.Maintain/updateallthegits.sh $BINDIR/updateallthegits.sh
cd $REPOROOT/00.Maintain
sudo  ln -s $REPOROOT/00.Maintain/upgrade-os.sh $BINDIR/upgrade-os.sh

