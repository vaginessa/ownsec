#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/byt3bl33d3r/sslstrip2.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ____  _     ____ _____ ____  ___ ____ ____  
/ ___/ ___|| |   / ___|_   _|  _ \|_ _|  _ \___ \ 
\___ \___ \| |   \___ \ | | | |_) || || |_) |__) |
 ___) |__) | |___ ___) || | |  _ < | ||  __// __/ 
|____/____/|_____|____/ |_| |_| \_\___|_|  |_____|
                                                  
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
sudo python setup.py install