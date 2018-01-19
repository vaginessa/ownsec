#does not work 16.04 24-5-17
#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Zapotek/cdpsnarf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf
GITCONF=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/cdpsnarf
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/cdpsnarf
DSKTPFL=cdpsnarf.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/cdpsnarf
#ph1a

echo "${bold}
  ____ ____  ____  ____  _   _    _    ____  _____ 
 / ___|  _ \|  _ \/ ___|| \ | |  / \  |  _ \|  ___|
| |   | | | | |_) \___ \|  \| | / _ \ | |_) | |_   
| |___| |_| |  __/ ___) | |\  |/ ___ \|  _ <|  _|  
 \____|____/|_|   |____/|_| \_/_/   \_\_| \_\_|    
        
INSTALL
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
make clean
GITRESET
GITSBMDLINIT
make -j 4
./cdpsnarf -h

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

