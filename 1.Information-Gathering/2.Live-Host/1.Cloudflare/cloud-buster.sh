#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack
git clone https://github.com/SageHack/cloud-buster.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster/SageHack/cloud-buster
#
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
chmod +x $GITREPOROOT/bust.sh
sudo ln -s $GITREPOROOT/bust.sh /usr/local/bin/bust 
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
#bust