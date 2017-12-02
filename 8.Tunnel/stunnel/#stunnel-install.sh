#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/airtrack/stunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel
GITCLONEDIR=/opt/ITSEC/8.Tunnel/stunnel/airtrack
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=stunnel.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ _____ _   _ _   _ _   _ _____ _     
/ ___|_   _| | | | \ | | \ | | ____| |    
\___ \ | | | | | |  \| |  \| |  _| | |    
 ___) || | | |_| | |\  | |\  | |___| |___ 
|____/ |_|  \___/|_| \_|_| \_|_____|_____|
             
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ITSEC-Install-Scripts/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-sslh.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

cargo build -v --release
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL