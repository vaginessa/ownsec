#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/DataSploit/datasploit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit
EXECUTEABLE1=datasploit.py
EXECUTEABLE2=datasploit
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/datasploit
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/datasploit
DSKTPFL=datasploit.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/datasploit
#ph1a
PIPRQRMNTS () {
	sudo -H pip install -r requirements.txt
	#1s3d

echo "${bold}
 ____    _  _____  _    ____  ____  _     ___ ___ _____ 
|  _ \  / \|_   _|/ \  / ___||  _ \| |   / _ \_ _|_   _|
| | | |/ _ \ | | / _ \ \___ \| |_) | |  | | | | |  | |  
| |_| / ___ \| |/ ___ \ ___) |  __/| |__| |_| | |  | |  
|____/_/   \_\_/_/   \_\____/|_|   |_____\___/___| |_|  
             
INSTALL                                       
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
PIPRQRMNTS

mv config_sample.py config.py
# vim config.py

# python datasploit.py test.com

CHMODXEX1

SYMLINKEX2TO1

#333d
CPDESKTFL
