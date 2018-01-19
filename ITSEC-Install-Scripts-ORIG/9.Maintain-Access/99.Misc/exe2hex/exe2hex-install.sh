#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/g0tmi1k/exe2hex.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k
EXECUTEABLE1=exe2hex.sh
EXECUTEABLE2=exe2hex
EXECUTEABLE3=exe2hex.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/99.Misc/exe2hex
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/99.Misc/exe2hex
DSKTPFL=exe2hex.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/99.Misc/exe2hex
#ph1a

echo "${bold}
 _______  _______ ____  _   _ _______  __
| ____\ \/ / ____|___ \| | | | ____\ \/ /
|  _|  \  /|  _|   __) | |_| |  _|  \  / 
| |___ /  \| |___ / __/|  _  | |___ /  \ 
|_____/_/\_\_____|_____|_| |_|_____/_/\_\
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-exe2hex.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex

python3 exe2hex.py "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
chmod +x $EXECUTEABLE3

sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2
#333d
CPDESKTFL

