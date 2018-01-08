#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
# 
srcdPT3=/opt/ownsec/0.Initial/src/PT3
chkdir=/opt/ownsec/0.Initial/src

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   _    ____ _____ _____ 
|  _ \ / \  |  _ \_   _|___ / 
| |_) / _ \ | |_) || |   |_ \ 
|  __/ ___ \|  _ < | |  ___) |
|_| /_/   \_\_| \_\|_| |____/ 
                              
INSTALL APPLICATIONS
${normal}"

sudo apt-get purge -remove -y default-jre
echo "${bold}
cd /opt/ownsec/0.Initial/src/PT3   
${normal}"
cd $srcdPT3
echo "${bold}
./1.Infogather.sh  
${normal}"
./1.Infogather.sh
echo "${bold}
./2.Vuln.sh 
${normal}"
./2.Vuln.sh
echo "${bold}
./3.Exploit.sh
${normal}"
./3.Exploit.sh
echo "${bold}
./4.Password.sh
${normal}"
./4.Password.sh
echo "${bold}
./5.Database.sh
${normal}"
./5.Database.sh
echo "${bold}
./6.Wireless.sh
${normal}"
./6.Wireless.sh
echo "${bold}
./7.Mitm.sh
${normal}"
./7.Mitm.sh
echo "${bold}
./8.Tunnel
${normal}"
./8.Tunnel.sh
echo "${bold}
./9.Maintain-Access
${normal}"
./9.Maintain-Access
echo "${bold}
./10.Stresstest
${normal}"
./10.Stresstest.sh
echo "${bold}
./11.Forensics not maintained yet
${normal}"
#./11.Forensics.sh
#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT3.txt


