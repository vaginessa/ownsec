#bug https://unix.stackexchange.com/questions/219152/pkglibexecdir-is-not-a-legitimate-directory


#!/bin/bash
#
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/darconeous/miredo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo
GITCLONEDIR=/opt/ITSEC/8.Tunnel/miredo/darconeous
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 __  __ ___ ____  _____ ____   ___  
|  \/  |_ _|  _ \| ____|  _ \ / _ \ 
| |\/| || || |_) |  _| | | | | | | |
| |  | || ||  _ <| |___| |_| | |_| |
|_|  |_|___|_| \_\_____|____/ \___/ 
          
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

./autogen.sh
