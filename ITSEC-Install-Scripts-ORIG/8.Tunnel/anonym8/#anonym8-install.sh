#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/HiroshiManRise/anonym8
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8
GITCONFDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/anonym8
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot/anonym8
DSKTPFL=anonym8.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/anonym8
#ph1a

echo "${bold}
    _    _   _  ___  _   ___   ____  __  ___  
   / \  | \ | |/ _ \| \ | \ \ / /  \/  |( _ ) 
  / _ \ |  \| | | | |  \| |\ V /| |\/| |/ _ \ 
 / ___ \| |\  | |_| | |\  | | | | |  | | (_) |
/_/   \_\_| \_|\___/|_| \_| |_| |_|  |_|\___/ 
           
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
chmod +x ./INSTALL.sh
#sudo ./INSTALL.sh