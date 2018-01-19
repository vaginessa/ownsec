#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/airtrack/stunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel
GITCLONEDIR=/opt/ITSEC/8.Tunnel/stunnel/airtrack
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/stunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnell/stunnel
DSKTPFL=stunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/stunnel
#ph1a

echo "${bold}
 ____ _____ _   _ _   _ _   _ _____ _     
/ ___|_   _| | | | \ | | \ | | ____| |    
\___ \ | | | | | |  \| |  \| |  _| | |    
 ___) || | | |_| | |\  | |\  | |___| |___ 
|____/ |_|  \___/|_| \_|_| \_|_____|_____|
             
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-sslh.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

cargo build -v --release
#333d
CPDESKTFL