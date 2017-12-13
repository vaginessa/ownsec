#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/joridos/custom-ssh-backdoor
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor/joridos/custom-ssh-backdoor/custom-ssh-backdoor
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor/joridos/custom-ssh-backdoor

echo "${bold}
 ____ ____  _   _ ____    _    ____ _  ______   ___   ___  ____  
/ ___/ ___|| | | | __ )  / \  / ___| |/ /  _ \ / _ \ / _ \|  _ \ 
\___ \___ \| |_| |  _ \ / _ \| |   | ' /| | | | | | | | | | |_) |
 ___) |__) |  _  | |_) / ___ \ |___| . \| |_| | |_| | |_| |  _ < 
|____/____/|_| |_|____/_/   \_\____|_|\_\____/ \___/ \___/|_| \_\
                 
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT


