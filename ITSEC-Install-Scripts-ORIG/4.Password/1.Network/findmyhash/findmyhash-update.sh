#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/frdmn/findmyhash.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
EXECUTEABLE1=findmyhash.sh
EXECUTEABLE2=findmyhash
EXECUTEABLE3=findmyhash.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/findmyhash
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/findmyhash
DSKTPFL=findmyhash.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/findmyhash
#hd6cv

echo "${bold}
 _____ ___ _   _ ____  __  ____   ___   _    _    ____  _   _ 
|  ___|_ _| \ | |  _ \|  \/  \ \ / / | | |  / \  / ___|| | | |
| |_   | ||  \| | | | | |\/| |\ V /| |_| | / _ \ \___ \| |_| |
|  _|  | || |\  | |_| | |  | | | | |  _  |/ ___ \ ___) |  _  |
|_|   |___|_| \_|____/|_|  |_| |_| |_| |_/_/   \_\____/|_| |_|
           
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

cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash

python findmyhash.py "$@"' > $EXECUTEABLE1
CHMODXEX1

SYMLINKEX2TO1

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

