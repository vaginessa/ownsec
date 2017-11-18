#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor
DSKTPFL=bella-builder.desktop

echo "${bold}
 ____  _____ _     _        _    
| __ )| ____| |   | |      / \   
|  _ \|  _| | |   | |     / _ \  
| |_) | |___| |___| |___ / ___ \ 
|____/|_____|_____|_____/_/   \_\
                
${normal}"

mkdir -p /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security
git clone https://github.com/Trietptm-on-Security/Bella.git


cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo rm -f /usr/local/bin/bella-builder
chmod +x BUILDER 
echo '#!/bin/bash
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
./BUILDER "$@"' > bella-builder.sh
chmod +x bella-builder.sh
sudo ln -s /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella/bella-builder.sh /usr/local/bin/bella-builder
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL