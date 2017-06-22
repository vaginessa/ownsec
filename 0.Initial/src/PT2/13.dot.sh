#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
USR ENV PT2         
${normal}"

echo "${bold}
... setting up bash git support ....
${normal}"
cd ~

git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

cp .bashrc ._bak_bashrc 
rm -f .bashrc && cp /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.bashrc .bashrc 


source .bashrc

echo "${bold}
... setting up CONKY ....
${normal}"
cp -R /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.conky .conky


sudo rm -f /usr/local/bin/conky_*

cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/5.CONKY/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/5.CONKY/$SHfiles /usr/local/bin/$SHfiles;done'

