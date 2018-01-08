#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/risent/dns2tcp.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp
GITCONFDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent
EXECUTEABLE1=dns2tcp
EXECUTEABLE2=dns2tcp
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=dns2tcp.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ ____ ____ _____ ____ ____  
|  _ \| \ | / ___|___ \_   _/ ___|  _ \ 
| | | |  \| \___ \ __) || || |   | |_) |
| |_| | |\  |___) / __/ | || |___|  __/ 
|____/|_| \_|____/_____||_| \____|_|    
            
INSTALL                                 
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

go build

chmod +x $EXECUTEABLE1

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2


