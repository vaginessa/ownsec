#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/D4Vinci/Dr0p1t-Framework
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci/Dr0p1t-Framework
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci/Dr0p1t-Framework/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci
EXECUTEABLE1=dr0p1t.sh
EXECUTEABLE2=dr0p1t
EXECUTEABLE3=Dr0p1t.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
DSKTPFL=Dr0p1t-Framework.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
#ph1a
echo "${bold}
 ____  ____   ___  ____  _ _____ 
|  _ \|  _ \ / _ \|  _ \/ |_   _|
| | | | |_) | | | | |_) | | | |  
| |_| |  _ <| |_| |  __/| | | |  
|____/|_| \_\\___/|_|   |_| |_|  
INSTALL            
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
chmod 777 -R Dr0p1t-Framework
cd Dr0p1t-Framework
sudo chmod +x install.sh
./install.sh
$EXECUTEABLE3

echo '#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci/Dr0p1t-Framework
python3 Dr0p1t.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1
SYMLINKEX2TO1
#333d
CPDESKTFL
