#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _   _ ____    _    ____ _  ______   ___   ___  ____  
/ ___/ ___|| | | | __ )  / \  / ___| |/ /  _ \ / _ \ / _ \|  _ \ 
\___ \___ \| |_| |  _ \ / _ \| |   | ' /| | | | | | | | | | |_) |
 ___) |__) |  _  | |_) / ___ \ |___| . \| |_| | |_| | |_| |  _ < 
|____/____/|_| |_|____/_/   \_\____|_|\_\____/ \___/ \___/|_| \_\
                 
${normal}"

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/custom-ssh-backdoor/joridos/custom-ssh-backdoor/custom-ssh-backdoor

GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/custom-ssh-backdoor/joridos/custom-ssh-backdoor
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/custom-ssh-backdoor/joridos/custom-ssh-backdoor
git clone https://github.com/joridos/custom-ssh-backdoor

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

fi
