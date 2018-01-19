#!/bin/bash


#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/byt3bl33d3r/MITMf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf
GITCONFDIR=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r
EXECUTEABLE1=mitmf.sh
EXECUTEABLE2=mitmf
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/mitmf
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/mitmf
DSKTPFL=mitmf.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/mitmf
#ph1a

echo "${bold}
 __  __ ___ _____ __  __ _____ 
|  \/  |_ _|_   _|  \/  |  ___|
| |\/| || |  | | | |\/| | |_   
| |  | || |  | | | |  | |  _|  
|_|  |_|___| |_| |_|  |_|_|    
          
UPDATE                          
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo -H pip2 install virtualenvwrapper
sudo ldconfig
sudo updatedb

GITRESET
GITSBMDLINIT
 
sudo -H pip2 install -r requirements.txt
sudo ldconfig
sudo updatedb

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf

python mitmf.py "$@"' > $EXECUTEABLE1

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


