#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ _   _  ____  ___   ___  
| __ )_ _| \ | |/ ___|/ _ \ / _ \ 
|  _ \| ||  \| | |  _| | | | | | |
| |_) | || |\  | |_| | |_| | |_| |
|____/___|_| \_|\____|\___/ \___/ 
    
${normal}"


mkdir -p /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
cd /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
git clone https://github.com/Hood3dRob1n/BinGoo.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
EXECUTEABLE1=bingoo
EXECUTEABLE2=bingoo
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFL=bingoo.desktop

cd $GITREPOROOT

sudo rm /usr/local/bin/$EXECUTEABLE2

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

#echo "#!/bin/bash
#cd /opt/ITSEC/1.Information-Gathering/11.Dork/scanner-inurlbr/googleinurl/SCANNER-INURLBR
#
#php inurlbr.php" >> $EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
#chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
