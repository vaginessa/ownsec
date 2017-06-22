#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#


srcdPT2=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2
#chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src
#

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____ ____  ____  
|  _ \| ____|  _ \/ ___| 
| | | |  _| | |_) \___ \ 
| |_| | |___|  __/ ___) |
|____/|_____|_|   |____/ 
           
${normal}"

echo "${bold}
cd /opt/ITSEC-Install-Scripts/0.Initial/src/PT2       
${normal}"

cd $srcdPT2

echo "${bold}
sudo ./1.DEB-Lists.sh    
${normal}"
sudo ./1.DEB-Lists.sh
echo "${bold}
sudo ./2.Node-Npm.sh   
${normal}"
sudo ./2.Node-Npm.sh
#./3.replace-deb-w-dummy.sh
#echo "${bold}
#sudo ./4.IDE.sh  
#${normal}"
#sudo ./4.IDE.sh
echo "${bold}
sudo ./5.Wifi-Firmware.sh 
${normal}"
sudo ./5.Wifi-Firmware.sh
echo "${bold}
sudo ./6.Java-JDK-JRE.sh
${normal}"
sudo ./6.Java-JDK-JRE.sh
echo "${bold}
sudo ./7.RBENV-RUBY.sh
${normal}"
sudo ./7.RBENV-RUBY.sh
echo "${bold}
sudo ./8.Postgres-MSF-DB.sh
${normal}"
sudo ./8.Postgres-MSF-DB.sh
echo "${bold}
sudo ./9.Virtualbox.sh
${normal}"
sudo ./9.Virtualbox.sh
#./10.OpenSSL-1.1.0.sh doesent really work out of the box due to the system installed openssl depencies.
echo "${bold}
sudo ./11.Docker.sh
${normal}"
sudo ./11.Docker.sh
echo "${bold}
sudo ./12.usr_environment.sh
${normal}"
sudo ./12.usr_environment.sh
echo "${bold}
sudo ./13.dot.sh
${normal}"
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


