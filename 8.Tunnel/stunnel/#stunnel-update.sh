#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ _____ _   _ _   _ _   _ _____ _     
/ ___|_   _| | | | \ | | \ | | ____| |    
\___ \ | | | | | |  \| |  \| |  _| | |    
 ___) || | | |_| | |\  | |\  | |___| |___ 
|____/ |_|  \___/|_| \_|_| \_|_____|_____|
             
${normal}"

mkdir -p /opt/ITSEC/8.Tunnel/stunnel/airtrack
cd /opt/ITSEC/8.Tunnel/stunnel/airtrack
git clone https://github.com/airtrack/stunnel.git

GITREPOROOT=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=stunnel.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

cargo build -v --release
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL