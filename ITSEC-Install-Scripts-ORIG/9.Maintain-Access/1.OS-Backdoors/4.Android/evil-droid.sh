#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/M4sc3r4n0/Evil-Droid
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid/M4sc3r4n0/Evil-Droid
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid/M4sc3r4n0
EXECUTEABLE1=evil-droid
EXECUTEABLE2=evil-droid
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid
DSKTPFL=evil-droid.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid
#ph1a
echo "${bold}
 _______     _____ _          ____  ____   ___ ___ ____  
| ____\ \   / /_ _| |        |  _ \|  _ \ / _ \_ _|  _ \ 
|  _|  \ \ / / | || |   _____| | | | |_) | | | | || | | |
| |___  \ V /  | || |__|_____| |_| |  _ <| |_| | || |_| |
|_____|  \_/  |___|_____|    |____/|_| \_\\___/___|____/ 
                                                         
INSTALL   
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

chmod +x $EXECUTEABLE1


SYMLINKEX2TO1
#333d
CPDESKTFL