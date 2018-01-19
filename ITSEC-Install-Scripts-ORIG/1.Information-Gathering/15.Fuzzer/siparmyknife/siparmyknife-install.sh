#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/foreni-packages/siparmyknife.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages
#ph1b
EXECUTEABLE1=siparmyknife.pl
EXECUTEABLE2=siparmyknife
EXECUTEABLE3=siparmyknife.sh
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/siparmyknife
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer/siparmyknife
DSKTPFL=siparmyknife.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/siparmyknife
#ph1a

echo "${bold}
 ____ ___ ____   _    ____  __  ____   ______  _  ___   _ ___ _____ _____ 
/ ___|_ _|  _ \ / \  |  _ \|  \/  \ \ / / ___|| |/ / \ | |_ _|  ___| ____|
\___ \| || |_) / _ \ | |_) | |\/| |\ V /\___ \| ' /|  \| || || |_  |  _|  
 ___) | ||  __/ ___ \|  _ <| |  | | | |  ___) | . \| |\  || ||  _| | |___ 
|____/___|_| /_/   \_\_| \_\_|  |_| |_| |____/|_|\_\_| \_|___|_|   |_____|
INSTALL      
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife
./siparmyknife.pl "$@"' >> $EXECUTEABLE3
chmod +x $EXECUTEABLE1
chmod +x $EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2
