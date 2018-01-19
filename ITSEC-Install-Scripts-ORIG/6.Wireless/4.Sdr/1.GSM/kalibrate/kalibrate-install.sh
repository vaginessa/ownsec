#!/bin/bash

GITREPO=https://github.com/steve-m/kalibrate-rtl
BRANCH=master
GITREPOROOT=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl
GITCLONEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/4.Sdr/1.GSM/gr-gsm
DSKTPFLSDEST=/home/$USER/.local/share/applications/3.Exploitation-Tools/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl
DSKTPFL=kalibrate-rtl.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/3.Exploitation-Tools/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl
#ph1a

echo "${bold}
 _  __    _    _     ___ ____  ____      _  _____ _____ 
| |/ /   / \  | |   |_ _| __ )|  _ \    / \|_   _| ____|
| ' /   / _ \ | |    | ||  _ \| |_) |  / _ \ | | |  _|  
| . \  / ___ \| |___ | || |_) |  _ <  / ___ \| | | |___ 
|_|\_\/_/   \_\_____|___|____/|_| \_\/_/   \_\_| |_____|
                                                                                  
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT
./bootstrap
./configure
make -j 4
sudo make install