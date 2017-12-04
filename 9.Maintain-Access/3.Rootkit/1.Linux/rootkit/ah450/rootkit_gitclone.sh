#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/ah450/rootkit
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/rootkit/ah450

echo "${bold}
 ____   ___   ___ _____ _  _____ _____ 
|  _ \ / _ \ / _ \_   _| |/ /_ _|_   _|
| |_) | | | | | | || | | ' / | |  | |  
|  _ <| |_| | |_| || | | . \ | |  | |  
|_| \_\\___/ \___/ |_| |_|\_\___| |_|  
                                       
GIT CLONE
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
