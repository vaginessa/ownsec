#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   ___ _____ ____   ___ _____ ______        ___   _ 
|  _ \ / _ \_   _|  _ \ / _ \_   _|  _ \ \      / / \ | |
| | | | | | || | | | | | | | || | | |_) \ \ /\ / /|  \| |
| |_| | |_| || | | |_| | |_| || | |  __/ \ V  V / | |\  |
|____/ \___/ |_| |____/ \___/ |_| |_|     \_/\_/  |_| \_|
           
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul
git clone https://github.com/wireghoul/dotdotpwn.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul/dotdotpwn
EXECUTEABLE1=dotdotpwn.pl
EXECUTEABLE2=dotdotpwn

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFL=dotdotpwn.desktop

sudo rm -f /usr/local/bin/$EXECUTEABLE2

cd $GITREPOROOT
git clean -f 
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dotdotpwn/wireghoul/dotdotpwn
perl dotdotpwn.pl "$@"' > $EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
