#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
# 
srcdPT3=/opt/ITSEC-Install-Scripts/0.Initial/src/PT3
chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    _     _   _____ _   _ _____ ___ _____ ____  _____ ____ ____  
   / \  | |   | | |_   _| | | | ____|_ _|_   _/ ___|| ____/ ___/ ___| 
  / _ \ | |   | |   | | | |_| |  _|  | |  | | \___ \|  _|| |   \___ \ 
 / ___ \| |___| |___| | |  _  | |___ | |  | |  ___) | |__| |___ ___) |
/_/   \_\_____|_____|_| |_| |_|_____|___| |_| |____/|_____\____|____/ 
       
${normal}"

echo "${bold}
cd /opt/ITSEC-Install-Scripts/0.Initial/src/PT3   
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
./8.Tunnel
#./9.Forensics.sh

#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT3.txt


