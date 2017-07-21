#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _   _ ____  _____ _   _ _   _ __  __ 
|  _ \| \ | / ___|| ____| \ | | | | |  \/  |
| | | |  \| \___ \|  _| |  \| | | | | |\/| |
| |_| | |\  |___) | |___| |\  | |_| | |  | |
|____/|_| \_|____/|_____|_| \_|\___/|_|  |_|
           
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens
git clone https://github.com/fwaeytens/dnsenum.git

sudo rm -f /usr/local/bin/dnsenum
sudo rm -f /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum/dnsenum.sh 
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnsenum.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

echo "#!/bin/bash 
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
perl dnsenum.pl" > /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum/dnsenum.sh
chmod +x /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum/dnsenum.sh
sudo ln -s /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum/dnsenum.sh /usr/local/bin/dnsenum
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

