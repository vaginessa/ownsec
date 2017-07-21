#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ____  ____    _  _____ 
 / ___|/ ___|  / \|_   _|
| |  _| |     / _ \ | |  
| |_| | |___ / ___ \| |  
 \____|\____/_/   \_\_|  
          
${normal}"

GITREPOGITFILE=$GITREPOROOT/.git

mkdir -p /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/gcat/byt3bl33d3r/
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/gcat/byt3bl33d3r/
git clone https://github.com/joridos/custom-ssh-backdoor

cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/gcat/byt3bl33d3r/gcat/

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive


