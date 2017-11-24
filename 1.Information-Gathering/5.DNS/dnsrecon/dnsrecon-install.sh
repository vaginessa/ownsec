#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/darkoperator/dnsrecon.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator/dnsrecon
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator
EXECUTEABLE1=dnsrecon
EXECUTEABLE2=dnsrecon
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnsrecon.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ ____  ____  _____ ____ ___  _   _ 
|  _ \| \ | / ___||  _ \| ____/ ___/ _ \| \ | |
| | | |  \| \___ \| |_) |  _|| |  | | | |  \| |
| |_| | |\  |___) |  _ <| |__| |__| |_| | |\  |
|____/|_| \_|____/|_| \_\_____\____\___/|_| \_|
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

GITSBMDLINIT
sudo -H pip2 install -r requirements.txt 

echo "#!/bin/bash 
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsrecon/darkoperator/dnsrecon
python dnsrecon.py" > $EXECUTEABLE1

chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
