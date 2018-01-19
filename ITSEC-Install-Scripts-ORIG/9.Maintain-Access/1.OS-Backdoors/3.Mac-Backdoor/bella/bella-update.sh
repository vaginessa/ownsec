#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Trietptm-on-Security/Bella.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security
EXECUTEABLE1=bella-builder.sh
EXECUTEABLE2=bella-builder
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
DSKTPFL=bella-builder.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
#hd6cv

echo "${bold}
 ____  _____ _     _        _    
| __ )| ____| |   | |      / \   
|  _ \|  _| | |   | |     / _ \  
| |_) | |___| |___| |___ / ___ \ 
|____/|_____|_____|_____/_/   \_\
                
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

chmod +x BUILDER 
echo '#!/bin/bash
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
./BUILDER "$@"' > $EXECUTEABLE1
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

