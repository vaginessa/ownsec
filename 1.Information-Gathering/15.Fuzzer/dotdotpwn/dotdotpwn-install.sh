#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/wireghoul/dotdotpwn.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul/dotdotpwn
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul
EXECUTEABLE1=dotdotpwn.pl
EXECUTEABLE2=dotdotpwn
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFL=dotdotpwn.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____   ___ _____ ____   ___ _____ ______        ___   _ 
|  _ \ / _ \_   _|  _ \ / _ \_   _|  _ \ \      / / \ | |
| | | | | | || | | | | | | | || | | |_) \ \ /\ / /|  \| |
| |_| | |_| || | | |_| | |_| || | |  __/ \ V  V / | |\  |
|____/ \___/ |_| |____/ \___/ |_| |_|     \_/\_/  |_| \_|
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

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul/dotdotpwn
perl dotdotpwn.pl "$@"' > $EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
