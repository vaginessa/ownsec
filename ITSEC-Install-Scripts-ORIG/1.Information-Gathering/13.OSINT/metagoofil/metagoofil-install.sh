#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/opsdisk/metagoofil.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk/metagoofil
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk
EXECUTEABLE1=metagoofil.py
EXECUTEABLE2=metagoofil
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/metagoofil
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/metagoofil
DSKTPFL=metagoofil.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/metagoofil
#ph1a

echo "${bold}
 __  __ _____ _____  _    ____  ___   ___  _____ ___ _     
|  \/  | ____|_   _|/ \  / ___|/ _ \ / _ \|  ___|_ _| |    
| |\/| |  _|   | | / _ \| |  _| | | | | | | |_   | || |    
| |  | | |___  | |/ ___ \ |_| | |_| | |_| |  _|  | || |___ 
|_|  |_|_____| |_/_/   \_\____|\___/ \___/|_|   |___|_____|
INSTALL
${normal}"

GITCLONEFUNC
GITCLONEFUNC
git clone $GITREPO
GITCLONEFUNC

### DEPS:
sudo -H pip2 install google
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

CHMODXEX1
SYMLINKEX2TO1

#333d  
CPDESKTFL
