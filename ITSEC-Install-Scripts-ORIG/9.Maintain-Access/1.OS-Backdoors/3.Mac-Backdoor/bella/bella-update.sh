#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Trietptm-on-Security/Bella.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security
EXECUTEABLE1=bella-builder.sh
EXECUTEABLE2=bella-builder
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
DSKTPFL=bella-builder.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _____ _     _        _    
| __ )| ____| |   | |      / \   
|  _ \|  _| | |   | |     / _ \  
| |_) | |___| |___| |___ / ___ \ 
|____/|_____|_____|_____/_/   \_\
                
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT
GITRESET
GITSBMDLINIT

chmod +x BUILDER 
echo '#!/bin/bash
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
./BUILDER "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

