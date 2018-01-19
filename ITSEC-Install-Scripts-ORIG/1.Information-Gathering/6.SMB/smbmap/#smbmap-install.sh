#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/ShawnDEvans/smbmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans
EXECUTEABLE1=smbmap.sh
EXECUTEABLE2=smbmap
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/6.SMB/smbmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB/smbmap
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____  __  __ ____  __  __    _    ____  
/ ___||  \/  | __ )|  \/  |  / \  |  _ \ 
\___ \| |\/| |  _ \| |\/| | / _ \ | |_) |
 ___) | |  | | |_) | |  | |/ ___ \|  __/ 
|____/|_|  |_|____/|_|  |_/_/   \_\_|    
     
INSTALL
${normal}"

GITCLONEFUNC
GITCLONEFUNC
git clone $GITREPO
GITCLONEFUNC

### DEPS:
sudo ldconfig
sudo updatedb
sudo apt-get purge --remove impacket
sudo -H pip3 uninstall impacket
sudo -H pip2 install impacket
#cd /opt/sys-dev-dep
#mkdir dependencies
#cd dependencies
#git clone https://github.com/CoreSecurity/impacket
#cd impacket 
#sudo apt-get purge --remove python-impacket
#sudo -H pip2 uninstall impacket
#sudo -H pip3 uninstall impacket
#sudo apt-get update 
#sudo apt-get upgrade
#sudo apt-get install python-impacket
sudo ldconfig
sudo updatedb
### DEPS END

GITSBMDLINIT

echo "#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
python smbmap.py" > $GITREPOROOT/$EXECUTEABLE1
CHMODXEX1
  
SYMLINKEX2TO1
#333d

CPDESKTFL

