#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/digininja/RSMangler
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler
GITCLONEDIR=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja
EXECUTEABLE1=rsmangler.sh
EXECUTEABLE2=rsmangler
EXECUTEABLE3=rsmangler.rb
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/rsmangler
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist/rsmangler
DSKTPFL=rsmangler.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/rsmangler
#ph1a

echo "${bold}
 ____  ____  __  __    _    _   _  ____ _     _____ ____  
|  _ \/ ___||  \/  |  / \  | \ | |/ ___| |   | ____|  _ \ 
| |_) \___ \| |\/| | / _ \ |  \| | |  _| |   |  _| | |_) |
|  _ < ___) | |  | |/ ___ \| |\  | |_| | |___| |___|  _ < 
|_| \_\____/|_|  |_/_/   \_\_| \_|\____|_____|_____|_| \_\
         
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler

ruby rsmangler.rb "$@"' > $EXECUTEABLE1

CHMODXEX3
CHMODXEX1

SYMLINKEX2TO1
#333d 
CPDESKTFL