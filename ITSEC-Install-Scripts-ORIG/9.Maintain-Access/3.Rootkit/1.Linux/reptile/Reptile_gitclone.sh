#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/f0rb1dd3n/Reptile
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/reptile/f0rb1dd3n

echo "${bold}
 ____  _____ ____ _____ ___ _     _____ 
|  _ \| ____|  _ \_   _|_ _| |   | ____|
| |_) |  _| | |_) || |  | || |   |  _|  
|  _ <| |___|  __/ | |  | || |___| |___ 
|_| \_\_____|_|    |_| |___|_____|_____|
                                          
GIT CLONE
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
