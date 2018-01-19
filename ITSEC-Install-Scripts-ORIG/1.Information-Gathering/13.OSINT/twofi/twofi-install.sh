#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/digininja/twofi.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja/twofi
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja
EXECUTEABLE1=twofi.rb
EXECUTEABLE2=twofi
EXECUTEABLE3=twofi.sh
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/twofi
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/twofi
DSKTPFL=twofi.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/twofi
#ph1a

echo "${bold}
 _______        _____  _____ ___ 
|_   _\ \      / / _ \|  ___|_ _|
  | |  \ \ /\ / / | | | |_   | | 
  | |   \ V  V /| |_| |  _|  | | 
  |_|    \_/\_/  \___/|_|   |___|
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
. ~/.bashrc
eval "$(rbenv init -)"
yes "N" | rbenv install 2.4.1
rbenv rehash
rbenv shell 2.4.1
### DEPS END

GITSBMDLINIT

bundle install

echo '#!/bin/bash -i

cd /opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja/twofi
source ~/.bashrc
eval "$(rbenv init -)"
rbenv shell 2.4.1

./twofi.rb "$*" ' > $GITREPOROOT/$EXECUTEABLE3
chmod a+x $GITREPOROOT/$EXECUTEABLE1
CHMODXEX3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2

#333d 
CPDESKTFL
