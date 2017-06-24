#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  __  __ _____ ____  _   _ ____  ____  _____ _   _ _   _ __  __ 
/ ___||  \/  |_   _|  _ \| | | / ___||  _ \| ____| \ | | | | |  \/  |
\___ \| |\/| | | | | |_) | | | \___ \| |_) |  _| |  \| | | | | |\/| |
 ___) | |  | | | | |  __/| |_| |___) |  _ <| |___| |\  | |_| | |  | |
|____/|_|  |_| |_| |_|    \___/|____/|_| \_\_____|_| \_|\___/|_|  |_|
        
${normal}"



mkdir -p /opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
cd /opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
git clone https://github.com/pentestmonkey/smtp-user-enum.git

sudo ldconfig
sudo updatedb

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey/smtp-user-enum
EXECUTEABLE1=smtp-user-enum.pl
EXECUTEABLE2=smtp-user-enum
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFL=smtp-user-enum.desktop

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL