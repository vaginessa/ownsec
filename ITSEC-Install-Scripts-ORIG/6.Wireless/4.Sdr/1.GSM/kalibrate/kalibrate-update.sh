#!/bin/bash

GITREPO=https://github.com/steve-m/kalibrate-rtl
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl
GITCONFDIR=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/4.Sdr/1.GSM/gr-gsm
DSKTPFLSDEST=/home/$USER/.local/share/applications/3.Exploitation-Tools/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl
DSKTPFL=kalibrate-rtl.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/3.Exploitation-Tools/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl
#hd6cv
echo "${bold}
 _  __    _    _     ___ ____  ____      _  _____ _____ 
| |/ /   / \  | |   |_ _| __ )|  _ \    / \|_   _| ____|
| ' /   / _ \ | |    | ||  _ \| |_) |  / _ \ | | |  _|  
| . \  / ___ \| |___ | || |_) |  _ <  / ___ \| | | |___ 
|_|\_\/_/   \_\_____|___|____/|_| \_\/_/   \_\_| |_____|
                                                                                  
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

#plh11
GITCLONEFUNC
make clean
GITRESET
GITSBMDLINIT
./bootstrap
./configure
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi