#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

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
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/ares
./ares-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/custom-ssh-backdoor
./custom-ssh-backdoor-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/gcat
./gcat-update.sh
## 2.Win
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/2.Win/dr0p1t-framework
./dr0p1t-framework-update.sh
## 3.Mac
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/3.Mac/bella
./bella-update.sh

# 2.Generate

cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/l0l
./l0l-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/owasp-zsc
./owasp-zsc-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/shellnoob
./shellnoob-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/the-backdoor-factory
./the-backdoor-factory-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/thefatrat
./thefatrat-update.sh
# cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/veil-evasion
#./veil-evasion-update.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/webacoo
./webacoo-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
9.Maintain-Access
${normal}"
