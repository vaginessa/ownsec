#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh
	
GITREPO=https://github.com/sqlmapproject/sqlmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
GITCONFDIR=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap/.git
GITCLONEDIR=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
EXECUTEABLE1=sqlmap.sh
EXECUTEABLE2=sqlmap
EXECUTEABLE3=sqlmapapi.sh
EXECUTEABLE4=sqlmapapi
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/sqlmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL/sqlmap
DSKTPFL=sqlmap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/sqlmap
#ph1a
echo "${bold}
 ____   ___  _     __  __    _    ____  
/ ___| / _ \| |   |  \/  |  / \  |  _ \ 
\___ \| | | | |   | |\/| | / _ \ | |_) |
 ___) | |_| | |___| |  | |/ ___ \|  __/ 
|____/ \__\_\_____|_|  |_/_/   \_\_|    
              
UPDATE
${normal}"
GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmap.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmapapi.py "$@"' > $EXECUTEABLE3

chmod +x $EXECUTEABLE3

sudo rm -f $BINDIR/$EXECUTEABLE4

SYMLINKEX2TO1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4

#333d 
CPDESKTFL


echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


