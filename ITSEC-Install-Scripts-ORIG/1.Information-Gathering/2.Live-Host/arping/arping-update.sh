#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/ThomasHabets/arping.git
BRANCH=arping-2.x
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets/arping
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets/arping/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/arping
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/arping
DSKTPFL=arping.desktop
gg6g6
	git clean -f
	git fetch origin
	git reset --hard origin/arping-2.x
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/arping
#ph1a

echo "${bold}
    _    ____  ____ ___ _   _  ____ 
   / \  |  _ \|  _ \_ _| \ | |/ ___|
  / _ \ | |_) | |_) | ||  \| | |  _ 
 / ___ \|  _ <|  __/| || |\  | |_| |
/_/   \_\_| \_\_|  |___|_| \_|\____|
         
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC


sudo make uninstall
make clean 
GITRESET
GITSBMDLINIT

./bootstrap.sh
./configure
make -j 4
sudo make install

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
