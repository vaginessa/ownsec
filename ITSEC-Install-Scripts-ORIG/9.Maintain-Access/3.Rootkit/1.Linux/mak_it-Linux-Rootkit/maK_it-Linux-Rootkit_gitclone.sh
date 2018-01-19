#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/maK-/maK_it-Linux-Rootkit
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/maK_it-linux-rootkit/maK-

echo "${bold}
 __  __    _    _  __    ___ _____ 
|  \/  |  / \  | |/ /   |_ _|_   _|
| |\/| | / _ \ | ' /     | |  | |  
| |  | |/ ___ \| . \     | |  | |  
|_|  |_/_/   \_\_|\_\___|___| |_|  
                   |_____|         
 _     ___ _   _ _   ___  __     ____   ___   ___ _____ _  _____ _____ 
| |   |_ _| \ | | | | \ \/ /    |  _ \ / _ \ / _ \_   _| |/ /_ _|_   _|
| |    | ||  \| | | | |\  /_____| |_) | | | | | | || | | ' / | |  | |  
| |___ | || |\  | |_| |/  \_____|  _ <| |_| | |_| || | | . \ | |  | |  
|_____|___|_| \_|\___//_/\_\    |_| \_\\___/ \___/ |_| |_|\_\___| |_|  
                                                                                                                       
GIT CLONE
${normal}"

#plh11
GITCLONEFUNC