#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/savio-code/hexorbase.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/.git
GITREPOBINROOT=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code
EXECUTEABLE1=hexorbase.sh
EXECUTEABLE2=hexorbase
EXECUTEABLE3=execute.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/hexorbase
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/hexorbase
DSKTPFL=hexorbase.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/hexorbase
#ph1a

echo "${bold}
 _   _ _______  _____  ____  ____    _    ____  _____ 
| | | | ____\ \/ / _ \|  _ \| __ )  / \  / ___|| ____|
| |_| |  _|  \  / | | | |_) |  _ \ / _ \ \___ \|  _|  
|  _  | |___ /  \ |_| |  _ <| |_) / ___ \ ___) | |___ 
|_| |_|_____/_/\_\___/|_| \_\____/_/   \_\____/|_____|
           
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITSBMDLINIT

cd $GITREPOBINROOT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase

python execute.py "$@"' > $GITREPOBINROOT/$EXECUTEABLE1

chmod +x $GITREPOBINROOT/$EXECUTEABLE3

chmod +x $GITREPOBINROOT/$EXECUTEABLE1

sudo ln -s $GITREPOBINROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

#333d

CPDESKTFL



#wget 'http://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip' 

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


