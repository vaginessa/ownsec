#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Eterna1/puszek-rootkit
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/puszek-rootkit/Eterna1

echo "${bold}
 ____  _   _ ____ __________ _  __     
|  _ \| | | / ___|__  / ____| |/ /     
| |_) | | | \___ \ / /|  _| | ' /_____ 
|  __/| |_| |___) / /_| |___| . \_____|
|_|    \___/|____/____|_____|_|\_\     
                                       
 ____   ___   ___ _____ _  _____ _____ 
|  _ \ / _ \ / _ \_   _| |/ /_ _|_   _|
| |_) | | | | | | || | | ' / | |  | |  
|  _ <| |_| | |_| || | | . \ | |  | |  
|_| \_\\___/ \___/ |_| |_|\_\___| |_|  
                                       
GIT CLONE
${normal}"

#plh11
GITCLONEFUNC