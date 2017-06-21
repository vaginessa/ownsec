#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

srcdPT2=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2
#chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src
#
cd $srcdPT2
sudo ./1.DEB-Lists.sh
sudo ./2.Node-Npm.sh
#./3.replace-deb-w-dummy.sh
sudo ./4.IDE.sh
sudo ./5.Wifi-Firmware.sh
sudo ./6.Java-JDK-JRE.sh
sudo ./7.RBENV-RUBY.sh
sudo ./8.Postgres-MSF-DB.sh
sudo ./9.Virtualbox.sh
#./10.OpenSSL-1.1.0.sh doesent really work out of the box due to the system installed openssl depencies.
sudo ./11.Docker.sh
sudo ./12.usr_environment.sh
sudo ./13.dot.sh
#
sudo updatedb
sudo ldconfig

node -v
npm -v
ruby -v
rbenv -v
rbenv local
rbenv global
docker -v 
java -version


#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT2.txt

#reboot


