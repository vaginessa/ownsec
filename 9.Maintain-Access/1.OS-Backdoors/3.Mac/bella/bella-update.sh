#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____ _     _        _    
| __ )| ____| |   | |      / \   
|  _ \|  _| | |   | |     / _ \  
| |_) | |___| |___| |___ / ___ \ 
|____/|_____|_____|_____/_/   \_\
                
${normal}"


GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac/bella/Trietptm-on-Security/Bella
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac/
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac
DSKTPFL=bella-builder.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac/bella/Trietptm-on-Security
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac/bella/Trietptm-on-Security
git clone https://github.com/Trietptm-on-Security/Bella.git

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

sudo rm -f /usr/local/bin/bella-builder
chmod +x BUILDER 
echo '#!/bin/bash
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac/bella/Trietptm-on-Security/Bella
./BUILDER "$@"' > bella-builder.sh
chmod +x bella-builder.sh
sudo ln -s /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac/bella/Trietptm-on-Security/Bella/bella-builder.sh /usr/local/bin/bella-builder
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

