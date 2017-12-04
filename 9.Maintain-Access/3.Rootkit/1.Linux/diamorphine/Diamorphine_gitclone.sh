#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/m0nad/Diamorphine
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Linux/diamorphine/m0nad

echo "${bold}
 ____ ___    _    __  __  ___  ____  _   _ ___ _   _ _____ 
|  _ \_ _|  / \  |  \/  |/ _ \|  _ \| | | |_ _| \ | | ____|
| | | | |  / _ \ | |\/| | | | | |_) | |_| || ||  \| |  _|  
| |_| | | / ___ \| |  | | |_| |  __/|  _  || || |\  | |___ 
|____/___/_/   \_\_|  |_|\___/|_|   |_| |_|___|_| \_|_____|
                                                           
GIT CLONE
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT