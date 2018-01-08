#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

BASEDIR=/opt/ownsec/9.Maintain-Access

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

9.Maintain-Access
${normal}"

################## 9.Maintain-Access ##################

# 1.OS-Backdoors
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/ares
./ares-update.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion
./phantom-evasion.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor
./custom-ssh-backdoor-update.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory
./the-backdoor-factory-update.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
./thefatrat-update.sh
# cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion
#./veil-evasion-update.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
./webacoo-update.sh

## 2.Win
cd $BASEDIR/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
./dr0p1t-framework-update.sh
## 3.Mac
cd $BASEDIR/1.OS-Backdoors/3.Mac-Backdoor/bella
./bella-update.sh

## 4.Android

## 99.Misc
cd $BASEDIR/99.Misc/exe2hex
./exe2hex-update.sh


echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
9.Maintain-Access
${normal}"
