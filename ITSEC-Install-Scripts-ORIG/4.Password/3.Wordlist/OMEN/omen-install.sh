#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/RUB-SysSec/OMEN
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
GITCLONEDIR=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec
EXECUTEABLE1=omen-createNG.sh
EXECUTEABLE2=omen-createNG
EXECUTEABLE3=omen-enumNG.sh
EXECUTEABLE4=omen-enumNG
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/omen
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist/omen
DSKTPFL=omen.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/omen
#ph1a

echo "${bold}
  ___  __  __ _____ _   _ 
 / _ \|  \/  | ____| \ | |
| | | | |\/| |  _| |  \| |
| |_| | |  | | |___| |\  |
 \___/|_|  |_|_____|_| \_|
                          
/RUB-SysSec/OMEN
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

make

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
./createNG "$@" ' > $EXECUTEABLE1

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
./createNG "$@" ' > $EXECUTEABLE3

CHMODXEX1
CHMODXEX3

sudo rm -f $BINDIR/$EXECUTEABLE4
SYMLINKEX2TO1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
#333d

CPDESKTFL