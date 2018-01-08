#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/googleinurl/SCANNER-INURLBR.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl
EXECUTEABLE1=inurlbr.php
EXECUTEABLE2=inurlbr
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFL=scanner-inurlbr.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____   ____ _   _      ___ _   _ _   _ ____  _     ____  ____  
/ ___| / ___| \ | |    |_ _| \ | | | | |  _ \| |   | __ )|  _ \ 
\___ \| |   |  \| |_____| ||  \| | | | | |_) | |   |  _ \| |_) |
 ___) | |___| |\  |_____| || |\  | |_| |  _ <| |___| |_) |  _ < 
|____/ \____|_| \_|    |___|_| \_|\___/|_| \_\_____|____/|_| \_\
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
cd /opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR

php inurlbr.php "$@"' >> $EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLEZ
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
