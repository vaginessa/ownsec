#does not work - node problem
# Depends Node.js 6.x https://docs.dripcap.org/build/linux.html
#!/bin/bash
#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/dripcap/dripcap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/dripcap/dripcap/dripcap
GITCLONEDIR=/opt/ITSEC/7.Mitm/dripcap/dripcap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/dripcap
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/dripcap
DSKTPFL=dripcap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/dripcap
#ph1a

echo "${bold}
 ____  ____  ___ ____   ____    _    ____  
|  _ \|  _ \|_ _|  _ \ / ___|  / \  |  _ \ 
| | | | |_) || || |_) | |     / _ \ | |_) |
| |_| |  _ < | ||  __/| |___ / ___ \|  __/ 
|____/|_| \_\___|_|    \____/_/   \_\_|    
             
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo npm install -g gulp node-gyp babel-cli
sudo npm install
### DEPS END

GITSBMDLINIT
ELECTRON_PATH=$(node -p "require('electron')")
chrpath -r $(dirname $ELECTRON_PATH) $ELECTRON_PATH
sudo setcap cap_net_raw,cap_net_admin=eip $ELECTRON_PATH
gulp
