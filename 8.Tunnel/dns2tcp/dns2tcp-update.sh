#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _   _ ____ ____ _____ ____ ____  
|  _ \| \ | / ___|___ \_   _/ ___|  _ \ 
| | | |  \| \___ \ __) || || |   | |_) |
| |_| | |\  |___) / __/ | || |___|  __/ 
|____/|_| \_|____/_____||_| \____|_|    
                                             
${normal}"

mkdir -p /opt/ITSEC/8.Tunnel/dns2tcp/risent
cd /opt/ITSEC/8.Tunnel/dns2tcp/risent
git clone https://github.com/risent/dns2tcp.git

GITREPOROOT=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp
GITREPOGITFILE=$GITREPOROOT/.git

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=dns2tcp.desktop


cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
go build

chmod +x dns2tcp
sudo rm -f /usr/local/bin/dns2tcp
sudo ln -s $GITREPOROOT/dns2tcp /usr/local/bin/dns2tcp

rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL