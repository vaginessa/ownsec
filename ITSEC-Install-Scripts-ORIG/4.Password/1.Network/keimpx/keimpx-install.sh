#!/bin/bash
#NOT WORKING
#
#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/inquisb/keimpx.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb
EXECUTEABLE1=keimpx.sh
EXECUTEABLE2=keimpx
EXECUTEABLE3=keimpx.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/keimpx
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/keimpx
DSKTPFL=keimpx.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/keimpx
#ph1a

echo "${bold}
 _  _______ ___ __  __ ______  __
| |/ / ____|_ _|  \/  |  _ \ \/ /
| ' /|  _|  | || |\/| | |_) \  / 
| . \| |___ | || |  | |  __//  \ 
|_|\_\_____|___|_|  |_|_|  /_/\_\
              
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-keimpx.txt") -r -- sudo apt-get install -y

sudo -H pip2 install -r requirements.txt
#sudo -H pip3 install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

#sudo python3 setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx

python keimpx.py "$@"' > $EXECUTEABLE1

CHMODXEX3
CHMODXEX1

SYMLINKEX2TO1

#333d

CPDESKTFL
