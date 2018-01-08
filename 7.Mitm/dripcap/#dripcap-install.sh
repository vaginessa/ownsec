#does not work - node problem
# Depends Node.js 6.x https://docs.dripcap.org/build/linux.html
#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/dripcap/dripcap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/dripcap/dripcap/dripcap
GITCLONEDIR=/opt/ITSEC/7.Mitm/dripcap/dripcap

APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____  ___ ____   ____    _    ____  
|  _ \|  _ \|_ _|  _ \ / ___|  / \  |  _ \ 
| | | | |_) || || |_) | |     / _ \ | |_) |
| |_| |  _ < | ||  __/| |___ / ___ \|  __/ 
|____/|_| \_\___|_|    \____/_/   \_\_|    
             
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
sudo npm install -g gulp node-gyp babel-cli
sudo npm install
### DEPS END

GITSBMDLINIT
ELECTRON_PATH=$(node -p "require('electron')")
chrpath -r $(dirname $ELECTRON_PATH) $ELECTRON_PATH
sudo setcap cap_net_raw,cap_net_admin=eip $ELECTRON_PATH
gulp
