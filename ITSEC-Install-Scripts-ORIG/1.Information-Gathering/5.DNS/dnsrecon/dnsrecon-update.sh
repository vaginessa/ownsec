#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/darkoperator/dnsrecon.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator/dnsrecon
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator/dnsrecon/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator
EXECUTEABLE1=dnsrecon
EXECUTEABLE2=dnsrecon
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnsrecon
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/dnsrecon
DSKTPFL=dnsrecon.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____  _   _ ____  ____  _____ ____ ___  _   _ 
|  _ \| \ | / ___||  _ \| ____/ ___/ _ \| \ | |
| | | |  \| \___ \| |_) |  _|| |  | | | |  \| |
| |_| | |\  |___) |  _ <| |__| |__| |_| | |\  |
|____/|_| \_|____/|_| \_\_____\____\___/|_| \_|
           
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

PIP2INSTREQ

echo "#!/bin/bash 
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator/dnsrecon
python dnsrecon.py" > $EXECUTEABLE1

chmod +x $EXECUTEABLE1

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

