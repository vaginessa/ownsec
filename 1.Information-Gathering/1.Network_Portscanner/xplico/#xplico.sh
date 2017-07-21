#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__  ______  _     ___ ____ ___  
\ \/ /  _ \| |   |_ _/ ___/ _ \ 
 \  /| |_) | |    | | |  | | | |
 /  \|  __/| |___ | | |__| |_| |
/_/\_\_|   |_____|___\____\___/ 
            
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico/xplico
GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/xplico/xplico
git clone https://github.com/xplico/xplico.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT

#installroutine

fi