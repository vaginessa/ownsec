#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/reyammer/shellnoob
BRANCH=master
GITREPOROOT=/opt/ITSEC/3.Exploitation-Tools/3.Shellcode-gen/shellnoob/reyammer/shellnoob
GITCONFDIR=/opt/ITSEC/3.Exploitation-Tools/3.Shellcode-gen/shellnoob/reyammer/shellnoob/.git
GITCLONEDIR=/opt/ITSEC/3.Exploitation-Tools/3.Shellcode-gen/shellnoob/reyammer
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/3.Exploitation-Tools/3.Shellcode-gen/shellnoob
DSKTPFLSDEST=/home/$USER/.local/share/applications/3.Exploitation-Tools/3.Shellcode-gen/shellnoob
DSKTPFL=shellnoob.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/3.Exploitation-Tools/3.Shellcode-gen/shellnoob
#ph1a

echo "${bold}
 ____  _   _ _____ _     _   _  ___   ___  ____  
/ ___|| | | | ____| |   | \ | |/ _ \ / _ \| __ ) 
\___ \| |_| |  _| | |   |  \| | | | | | | |  _ \ 
 ___) |  _  | |___| |___| |\  | |_| | |_| | |_) |
|____/|_| |_|_____|_____|_| \_|\___/ \___/|____/ 
           
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
sudo python shellnoob.py --install --force


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