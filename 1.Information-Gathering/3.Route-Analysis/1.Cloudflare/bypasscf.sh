#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
git clone https://github.com/HackerOrientado/BypassCF.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
DSKTPFL=bypasscf.desktop

sudo rm -f /usr/local/bin/bypasscf
cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
#

git submodule init 
git submodule update --recursive
rm -f bypasscf.sh
echo "#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF

perl BypassCF.pl" > bypasscf.sh
chmod +x bypasscf.sh

sudo ln -s $GITREPOROOT/bypasscf.sh /usr/local/bin/bypasscf
  mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

