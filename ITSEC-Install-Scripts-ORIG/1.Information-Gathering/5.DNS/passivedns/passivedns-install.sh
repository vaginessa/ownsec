#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/gamelinux/passivedns.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux/passivedns
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/passivedns
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/passivedns
DSKTPFL=passivedns.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/passivedns
#ph1a

echo "${bold}
 ____   _    ____ ____ _____     _______ ____  _   _ ____  
|  _ \ / \  / ___/ ___|_ _\ \   / / ____|  _ \| \ | / ___| 
| |_) / _ \ \___ \___ \| | \ \ / /|  _| | | | |  \| \___ \ 
|  __/ ___ \ ___) |__) | |  \ V / | |___| |_| | |\  |___) |
|_| /_/   \_\____/____/___|  \_/  |_____|____/|_| \_|____/ 
    
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-passivedns.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
./configure
make -j 4
sudo make install
#333d
CPDESKTFL
