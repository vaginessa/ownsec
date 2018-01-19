#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/RUB-SysSec/OMEN
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
GITCONFDIR=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN/.git
GITCLONEDIR=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec
EXECUTEABLE1=omen-createNG.sh
EXECUTEABLE2=omen-createNG
EXECUTEABLE3=omen-enumNG.sh
EXECUTEABLE4=omen-enumNG
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/omen
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist/omen
DSKTPFL=omen.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/omen
# gg6g6
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
#ph1a

echo "${bold}
  ___  __  __ _____ _   _ 
 / _ \|  \/  | ____| \ | |
| | | | |\/| |  _| |  \| |
| |_| | |  | | |___| |\  |
 \___/|_|  |_|_____|_| \_|
                          
/RUB-SysSec/OMEN 
UPDATE
${normal}"

GITUPTODATE
if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT

make

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
./createNG "$@" ' > $EXECUTEABLE1

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
./createNG "$@" ' > $EXECUTEABLE3

CHMODXEX1
CHMODXEX3

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