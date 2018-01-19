#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/airtrack/stunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/stunnel/airtrack
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/stunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnell/stunnel
DSKTPFL=stunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/stunnelp

#hd6cv

echo "${bold}
 ____ _____ _   _ _   _ _   _ _____ _     
/ ___|_   _| | | | \ | | \ | | ____| |    
\___ \ | | | | | |  \| |  \| |  _| | |    
 ___) || | | |_| | |\  | |\  | |___| |___ 
|____/ |_|  \___/|_| \_|_| \_|_____|_____|
             
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT

cargo build -v --release

#333d
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi