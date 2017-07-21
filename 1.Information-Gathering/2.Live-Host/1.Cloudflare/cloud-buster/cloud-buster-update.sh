#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ____ _     ___  _   _ ____        ____  _   _ ____ _____ _____ ____  
 / ___| |   / _ \| | | |  _ \      | __ )| | | / ___|_   _| ____|  _ \ 
| |   | |  | | | | | | | | | |_____|  _ \| | | \___ \ | | |  _| | |_) |
| |___| |__| |_| | |_| | |_| |_____| |_) | |_| |___) || | | |___|  _ < 
 \____|_____\___/ \___/|____/      |____/ \___/|____/ |_| |_____|_| \_\
         
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/1.Cloudflare
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Cloudflare
DSKTPFL=cloud-buster.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo rm -r /usr/local/bin/bust
sudo -H pip3 install dnspython3

echo "#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
python3 bust" >> $GITREPOROOT/bust.sh

sudo rm -f /usr/local/bin/bust
chmod +x $GITREPOROOT/bust.sh
sudo ln -s $GITREPOROOT/bust.sh /usr/local/bin/bust 
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
#bust