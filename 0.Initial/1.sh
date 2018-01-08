#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

srcdPT1=/opt/ownsec/0.Initial/src/PT1
#chkdir=/opt/ownsec/0.Initial/src

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

