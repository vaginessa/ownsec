#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/wireghoul/dotdotpwn.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul/dotdotpwn
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul
EXECUTEABLE1=dotdotpwn.pl
EXECUTEABLE2=dotdotpwn
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/dotdotpwn
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer/dotdotpwn
DSKTPFL=dotdotpwn.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/dotdotpwn
#ph1a

echo "${bold}
 ____   ___ _____ ____   ___ _____ ______        ___   _ 
|  _ \ / _ \_   _|  _ \ / _ \_   _|  _ \ \      / / \ | |
| | | | | | || | | | | | | | || | | |_) \ \ /\ / /|  \| |
| |_| | |_| || | | |_| | |_| || | |  __/ \ V  V / | |\  |
|____/ \___/ |_| |____/ \___/ |_| |_|     \_/\_/  |_| \_|
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul/dotdotpwn
perl dotdotpwn.pl "$@"' > $EXECUTEABLE2

CHMODXEX1
CHMODXEX2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
#333d
CPDESKTFL
