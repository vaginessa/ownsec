#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/HackerOrientado/BypassCF.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
EXECUTEABLE1=bypasscf.sh
EXECUTEABLE2=bypasscf
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
DSKTPFL=bypasscf.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a


echo "${bold}
 ______   ______   _    ____ ____   ____ _____ 
| __ ) \ / /  _ \ / \  / ___/ ___| / ___|  ___|
|  _ \\ V /| |_) / _ \ \___ \___ \| |   | |_   
| |_) || | |  __/ ___ \ ___) |__) | |___|  _|  
|____/ |_| |_| /_/   \_\____/____/ \____|_|    
      
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then

sudo rm -f /usr/local/bin/bypasscf

GITCLONEFUNC

GITRESET

GITSBMDLINIT

echo "#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF

perl BypassCF.pl" > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

SYMLINKEX2TO1
rm -f  $DSKTPFLSDEST/$DSKTPFL
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
