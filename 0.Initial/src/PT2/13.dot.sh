#!/bin/bash

cd ~

git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

cp .bashrc ._bak_bashrc 
rm -f .bashrc && cp /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.bashrc .bashrc 
sudo chown -R $USER/$USER /home/$USER
sudo chown -R $USER/$USER /opt
source .bashrc

cp -R /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.conky .conky


sudo rm -f /usr/local/bin/conky_*

cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/5.CONKY/
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/startstop/0.Services/5.CONKY/$SHfiles /usr/local/bin/$SHfiles;done'

sudo chown -R $USER/$USER /home/$USER
sudo chown -R $USER/$USER /opt