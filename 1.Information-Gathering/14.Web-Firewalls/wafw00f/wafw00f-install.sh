#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/EnableSecurity/wafw00f.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/14.Web-Firewalls/wafw00f/EnableSecurity/wafw00f
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/14.Web-Firewalls/wafw00f/EnableSecurity
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/14.Web-Firewalls
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/14.Web-Firewalls
DSKTPFL=wafw00f.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
__        ___    _______        _____   ___  _____ 
\ \      / / \  |  ___\ \      / / _ \ / _ \|  ___|
 \ \ /\ / / _ \ | |_   \ \ /\ / / | | | | | | |_   
  \ V  V / ___ \|  _|   \ V  V /| |_| | |_| |  _|  
   \_/\_/_/   \_\_|      \_/\_/  \___/ \___/|_|    
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

# needs makefile fix for pip "sudo -H pip install ..."
sed -i -e 's/pip install/sudo -H pip install/g' Makefile
make -j 4
sudo python setup.py install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
