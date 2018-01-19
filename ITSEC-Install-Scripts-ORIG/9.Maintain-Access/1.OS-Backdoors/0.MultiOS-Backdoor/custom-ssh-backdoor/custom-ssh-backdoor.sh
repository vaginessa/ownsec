#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/joridos/custom-ssh-backdoor
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor/joridos/custom-ssh-backdoor/custom-ssh-backdoor
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor/joridos/custom-ssh-backdoor
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor
DSKTPFL=custom-ssh-backdoor.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/custom-ssh-backdoor
echo "${bold}
 ____ ____  _   _ ____    _    ____ _  ______   ___   ___  ____  
/ ___/ ___|| | | | __ )  / \  / ___| |/ /  _ \ / _ \ / _ \|  _ \ 
\___ \___ \| |_| |  _ \ / _ \| |   | ' /| | | | | | | | | | |_) |
 ___) |__) |  _  | |_) / ___ \ |___| . \| |_| | |_| | |_| |  _ < 
|____/____/|_| |_|____/_/   \_\____|_|\_\____/ \___/ \___/|_| \_\
                 
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT


