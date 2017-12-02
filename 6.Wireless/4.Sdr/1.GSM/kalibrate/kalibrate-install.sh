#!/bin/bash

GITREPO=https://github.com/steve-m/kalibrate-rtl
BRANCH=master
GITREPOROOT=/opt/ITSEC-Install-Scripts/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl
GITCLONEDIR=/opt/ITSEC-Install-Scripts/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _  __    _    _     ___ ____  ____      _  _____ _____ 
| |/ /   / \  | |   |_ _| __ )|  _ \    / \|_   _| ____|
| ' /   / _ \ | |    | ||  _ \| |_) |  / _ \ | | |  _|  
| . \  / ___ \| |___ | || |_) |  _ <  / ___ \| | | |___ 
|_|\_\/_/   \_\_____|___|____/|_| \_\/_/   \_\_| |_____|
                                                                                  
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT
./bootstrap
./configure
make -j 4
sudo make install