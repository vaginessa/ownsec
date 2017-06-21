##!/bin/bash

#DOES NOT WORK - installed from apt
mkdir -p /opt/ITSEC/7.Mitm/tcpreplay/appneta
cd /opt/ITSEC/7.Mitm/tcpreplay/appneta
git clone https://github.com/appneta/tcpreplay.git


GITREPOROOT=/opt/ITSEC/7.Mitm/tcpreplay/appneta/tcpreplay
EXECUTEABLE1=dnschef.py
EXECUTEABLE2=dnschef

sudo ldconfig
sudo updatedb

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm $GITREPOROOT/$EXECUTEABLE2


cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive



echo "#!/bin/bash 
cd /opt/ITSEC/7.Mitm/tcpreplay/appneta/tcpreplay
python dnschef.py" > $GITREPOROOT/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE2


