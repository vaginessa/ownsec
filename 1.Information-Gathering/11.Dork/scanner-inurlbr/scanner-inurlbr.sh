#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   ____ _   _      ___ _   _ _   _ ____  _     ____  ____  
/ ___| / ___| \ | |    |_ _| \ | | | | |  _ \| |   | __ )|  _ \ 
\___ \| |   |  \| |_____| ||  \| | | | | |_) | |   |  _ \| |_) |
 ___) | |___| |\  |_____| || |\  | |_| |  _ <| |___| |_) |  _ < 
|____/ \____|_| \_|    |___|_| \_|\___/|_| \_\_____|____/|_| \_\
         
${normal}"


mkdir -p /opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl
cd /opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl
git clone https://github.com/googleinurl/SCANNER-INURLBR.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR
EXECUTEABLE1=inurlbr.php
EXECUTEABLE2=inurlbr
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFL=scanner-inurlbr.desktop


cd $GITREPOROOT

sudo rm /usr/local/bin/$EXECUTEABLE2

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR

php inurlbr.php "$@"' >> $EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL