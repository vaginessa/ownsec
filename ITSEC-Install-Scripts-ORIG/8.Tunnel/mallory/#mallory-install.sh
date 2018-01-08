#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/justmao945/mallory.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory
GITCONFDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/mallory
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/mallory
DSKTPFL=mallory.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/mallory
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 __  __    _    _     _     ___  ______   __
|  \/  |  / \  | |   | |   / _ \|  _ \ \ / /
| |\/| | / _ \ | |   | |  | | | | |_) \ V / 
| |  | |/ ___ \| |___| |__| |_| |  _ < | |  
|_|  |_/_/   \_\_____|_____\___/|_| \_\|_|  
          
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
#nothing todo here