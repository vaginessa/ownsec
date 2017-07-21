#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ______   ______   _    ____ ____   ____ _____ 
| __ ) \ / /  _ \ / \  / ___/ ___| / ___|  ___|
|  _ \\ V /| |_) / _ \ \___ \___ \| |   | |_   
| |_) || | |  __/ ___ \ ___) |__) | |___|  _|  
|____/ |_| |_| /_/   \_\____/____/ \____|_|    
      
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
DSKTPFL=bypasscf.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
git clone https://github.com/HackerOrientado/BypassCF.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

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
rm -f  $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi