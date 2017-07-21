#!/bin/bash

mkdir -p /opt/ITSEC/9.Maintain-Access/2.Generate/veil-evasion/Veil-Framework
cd /opt/ITSEC/9.Maintain-Access/2.Generate/veil-evasion/Veil-Framework
git clone https://github.com/Veil-Framework/Veil-Evasion
#

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__     _______ ___ _          _______     ___    ____ ___ ___  _   _ 
\ \   / / ____|_ _| |        | ____\ \   / / \  / ___|_ _/ _ \| \ | |
 \ \ / /|  _|  | || |   _____|  _|  \ \ / / _ \ \___ \| | | | |  \| |
  \ V / | |___ | || |__|_____| |___  \ V / ___ \ ___) | | |_| | |\  |
   \_/  |_____|___|_____|    |_____|  \_/_/   \_\____/___\___/|_| \_|
            
${normal}"

GITREPOGITFILE=$GITREPOROOT/.git

cd /opt/ITSEC/9.Maintain-Access/2.Generate/veil-evasion/Veil-Framework/Veil-Evasion

sudo rm /usr/local/bin/veil-evasion
git fetch origin
git reset --hard origin/master
git clean -f 
git pull

sed -i 's/wine-stable/wine/' /opt/ITSEC/9.Maintain-Access/2.Generate/veil-evasion/Veil-Framework/Veil-Evasion/setup/setup.sh
#git submodule init && git submodule update --recursive

chmod +x Veil-Evasion.py
sudo ln -s /opt/ITSEC/9.Maintain-Access/2.Generate/veil-evasion/Veil-Framework/Veil-Evasion /usr/local/bin/veil-evasion