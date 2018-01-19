#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/googleinurl/SCANNER-INURLBR.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl
EXECUTEABLE1=inurlbr.php
EXECUTEABLE2=inurlbr
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/11.Dork/scanner-inurlbr
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork/scanner-inurlbr
DSKTPFL=scanner-inurlbr.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/11.Dork/scanner-inurlbr
#ph1a

echo "${bold}
 ____   ____ _   _      ___ _   _ _   _ ____  _     ____  ____  
/ ___| / ___| \ | |    |_ _| \ | | | | |  _ \| |   | __ )|  _ \ 
\___ \| |   |  \| |_____| ||  \| | | | | |_) | |   |  _ \| |_) |
 ___) | |___| |\  |_____| || |\  | |_| |  _ <| |___| |_) |  _ < 
|____/ \____|_| \_|    |___|_| \_|\___/|_| \_\_____|____/|_| \_\
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR

php inurlbr.php "$@"' >> $EXECUTEABLE2
CHMODXEX1
CHMODXEX2

SYMLINKEX2TO1
#333d
CPDESKTFL
