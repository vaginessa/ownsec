#!/bin/bash -i
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
./1.DEB-Lists.sh    
${normal}"
./1.DEB-Lists.sh
echo "${bold}
./2.Node-Npm.sh   
${normal}"
./2.Node-Npm.sh
#./3.replace-deb-w-dummy.sh
#echo "${bold}
#./4.IDE.sh  
#${normal}"
#./4.IDE.sh
echo "${bold}
./5.Wifi-Firmware.sh 
${normal}"
./5.Wifi-Firmware.sh
echo "${bold}
./6.Java-JDK-JRE.sh
${normal}"
./6.Java-JDK-JRE.sh
echo "${bold}
./7.RBENV-RUBY.sh
source ~/.bashrc
${normal}"
./7.RBENV-RUBY.sh
source ~/.bashrc
RUBYVERSION=$(lynx --dump https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version )

rbenv install $RUBYVERSION
rbenv rehash
echo "${bold}
./8.Postgres-MSF-DB.sh
${normal}"
./8.Postgres-MSF-DB.sh
echo "${bold}
./9.Virtualbox.sh
${normal}"
./9.Virtualbox.sh
#./10.OpenSSL-1.1.0.sh doesent really work out of the box due to the system installed openssl depencies.
echo "${bold}
./11.Docker.sh
${normal}"
./11.Docker.sh
echo "${bold}
./12.usr_environment.sh
source ~/.bashrc
${normal}"
./12.usr_environment.sh
source ~/.bashrc
echo "${bold}
./13.dot.sh
${normal}"
./13.dot.sh
#
updatedb
ldconfig

sudo cp /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

sudo cp /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/grub /etc/default/grub
sudo update-grub
#exec -l $SHELL
updatedb
ldconfig
node -v
npm -v
ruby -v
rbenv -v
rbenv local $RUBYVERSION
rbenv local
rbenv global $RUBYVERSION
rbenv global
docker -v 
java -version
#exit 0
echo "${bold}
Done, reboot now         
${normal}"
#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT2.txt

#reboot


