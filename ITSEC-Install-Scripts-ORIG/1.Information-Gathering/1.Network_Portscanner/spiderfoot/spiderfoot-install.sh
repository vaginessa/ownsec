#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/smicallef/spiderfoot.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef
EXECUTEABLE1=sf.sh
EXECUTEABLE2=spiderfoot
EXECUTEABLE3=sfcli.sh
EXECUTEABLE4=spiderfoot_cli
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/spiderfoot
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/spiderfoot
DSKTPFL1=spiderfoot.desktop
DSKTPFL2=spiderfoot_cli.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/spiderfoot
#ph1a

echo "${bold}
 ____  ____ ___ ____  _____ ____  _____ ___   ___ _____ 
/ ___||  _ \_ _|  _ \| ____|  _ \|  ___/ _ \ / _ \_   _|
\___ \| |_) | || | | |  _| | |_) | |_ | | | | | | || |  
 ___) |  __/| || |_| | |___|  _ <|  _|| |_| | |_| || |  
|____/|_|  |___|____/|_____|_| \_\_|   \___/ \___/ |_|  
                         
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# No apt deps, installing pip deps manually wo requirements.txt
sudo -H pip2 install lxml netaddr M2Crypto cherrypy mako requests bs4
### DEPS END

make clean
GITSBMDLINIT

#sudo python setup.py install 

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

python sf.py "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

python sfcli.py "$@"' > $EXECUTEABLE3
chmod +x $EXECUTEABLE3

SYMLINKEX2TO1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

