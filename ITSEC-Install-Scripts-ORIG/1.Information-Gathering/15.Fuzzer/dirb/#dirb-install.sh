#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/seifreed/dirb.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/dirb
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer/dirb
DSKTPFL=dirb.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/dirb
#ph1a

echo "${bold}
 ____ ___ ____  ____  
|  _ \_ _|  _ \| __ ) 
| | | | || |_) |  _ \ 
| |_| | ||  _ <| |_) |
|____/___|_| \_\____/ 
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
./configure
make -j 4
sudo make install

#333d 
CPDESKTFL