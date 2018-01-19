#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/savio-code/fern-wifi-cracker.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code
EXECUTEABLE1=execute.py
EXECUTEABLE2=fern-wifi-cracker
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/fern-wifi-cracker
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/fern-wifi-cracker
DSKTPFL=fern-wifi-cracker.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/fern-wifi-cracker
#ph1a
echo "${bold}
 _____ _____ ____  _   _ 
|  ___| ____|  _ \| \ | |
| |_  |  _| | |_) |  \| |
|  _| | |___|  _ <| |\  |
|_|   |_____|_| \_\_| \_|
          
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
echo "#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker

sudo python execute.py" > $EXECUTEABLE2
sudo chmod +x $EXECUTEABLE1
sudo chmod +x $EXECUTEABLE2

sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
#333d
CPDESKTFL
