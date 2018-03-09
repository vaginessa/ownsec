#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/fwaeytens/dnsenum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens
EXECUTEABLE1=dnsenum.sh 
EXECUTEABLE2=dnsenum
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnsenum
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/dnsenum
DSKTPFL=dnsenum.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnsenum
#ph1a

echo "${bold}
 ____  _   _ ____  _____ _   _ _   _ __  __ 
|  _ \| \ | / ___|| ____| \ | | | | |  \/  |
| | | |  \| \___ \|  _| |  \| | | | | |\/| |
| |_| | |\  |___) | |___| |\  | |_| | |  | |
|____/|_| \_|____/|_____|_| \_|\___/|_|  |_|
           
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

echo "#!/bin/bash 
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
perl dnsenum.pl" > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

sudo rm -f $BINDIR/dnsenum

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
