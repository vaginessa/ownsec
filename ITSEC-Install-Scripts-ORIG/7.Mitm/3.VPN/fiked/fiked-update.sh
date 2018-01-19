#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

echo "${bold}
 _____ ___ _  _______ ____  
|  ___|_ _| |/ / ____|  _ \ 
| |_   | || ' /|  _| | | | |
|  _|  | || . \| |___| |_| |
|_|   |___|_|\_\_____|____/ 
           
UPDATE
${normal}"

GITREPO=https://github.com/droe/fiked.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe/fiked
GITCONFDIR=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe/fiked/.git
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/3.VPN/fiked
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/3.VPN/fiked
DSKTPFL=fiked.desktop
gg6g6
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/3.VPN/fiked
#ph1a

ggdgdssddw

then

GITCLONEFUNC
GITCLONEFUNC
git clone $GITREPO

else

ggdgdssdw

fi

GITCLONEFUNC

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
GITCLONEFUNC

sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

sudo rm -f makefile
cp GNUmakefile makefile
make -j 4
sudo make install
sudo 
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

