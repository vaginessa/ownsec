#!/bin/bash


#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/byt3bl33d3r/MITMf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf
GITCLONEDIR=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r
EXECUTEABLE1=mitmf.sh
EXECUTEABLE2=mitmf
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mit/mmitmf
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/mitmf
DSKTPFL=mitmf.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/mitmf
#ph1a
echo "${bold}
 __  __ ___ _____ __  __ _____ 
|  \/  |_ _|_   _|  \/  |  ___|
| |\/| || |  | | | |\/| | |_   
| |  | || |  | | | |  | |  _|  
|_|  |_|___| |_| |_|  |_|_|    
          
INSTALL                          
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-mitmf.txt") -r -- sudo apt-get install -y
sudo -H pip2 install virtualenvwrapper
sudo ldconfig
sudo updatedb
 
sudo -H pip2 install -r requirements.txt
sudo ldconfig
sudo updatedb
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf

python mitmf.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1

SYMLINKEX2TO1
#333d
CPDESKTFL