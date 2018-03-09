#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/anestisb/WeBaCoo
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo/anestisb/WeBaCoo
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo/anestisb/WeBaCoo/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo/anestisb
EXECUTEABLE1=webacoo.pl
EXECUTEABLE2=webacoo
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
DSKTPFL=webacoo.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
#hd6cv

echo "${bold}
__        _______ ____    _    ____ ___   ___  
\ \      / / ____| __ )  / \  / ___/ _ \ / _ \ 
 \ \ /\ / /|  _| |  _ \ / _ \| |  | | | | | | |
  \ V  V / | |___| |_) / ___ \ |__| |_| | |_| |
   \_/\_/  |_____|____/_/   \_\____\___/ \___/ 
          
UPDATE
${normal}"

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-webacoo.txt") -r -- sudo apt-get install -y
### DEPS END

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT

sudo rm -f $BINDIR/webacoo
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


