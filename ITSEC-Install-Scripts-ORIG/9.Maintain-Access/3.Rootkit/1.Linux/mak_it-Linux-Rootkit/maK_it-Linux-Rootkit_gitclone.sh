#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

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

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT