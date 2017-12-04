#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
# 
srcdPT1=/opt/ITSEC-Install-Scripts/0.Initial/src/PT1
#chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   _    ____ _____ _ 
|  _ \ / \  |  _ \_   _/ |
| |_) / _ \ | |_) || | | |
|  __/ ___ \|  _ < | | | |
|_| /_/   \_\_| \_\|_| |_|
                          
SYSTEM UPDATE/UPGRADE
${normal}"


cd $srcdPT1
./1-Upgrade.sh

#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT1.txt

echo "${bold}
Done, reboot now         
${normal}"

#reboot

