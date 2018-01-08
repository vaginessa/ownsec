#####

does not work, build error

bold=$(tput bold)
normal=$(tput sgr0)

EXECUTEABLE=moloch.sh
EXECUTEABLE1=moloch
GITREPOROOT=/opt/ITSEC/7.Mitm/moloch/aol/moloch
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=moloch.desktop

echo "${bold}
 __  __  ___  _     ___   ____ _   _ 
|  \/  |/ _ \| |   / _ \ / ___| | | |
| |\/| | | | | |  | | | | |   | |_| |
| |  | | |_| | |__| |_| | |___|  _  |
|_|  |_|\___/|_____\___/ \____|_| |_|
           
INSTALL
${normal}"

### DEPS:
## Installed w apt lists - see /opt/ownsec/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-moloch.txt") -r -- sudo apt-get install -y
### DEPS END

mkdir -p /opt/ITSEC/7.Mitm/moloch/aol/moloch
cd /opt/ITSEC/7.Mitm/moloch/aol/moloch
wget https://files.molo.ch/builds/ubuntu-16.04/moloch_0.20.1-1_amd64.deb
sudo dpkg -i moloch_0.20.1-1_amd64.deb
/data/moloch/bin/Configure

systemctl start elasticsearch.service
/data/moloch/db/db.pl http://localhost:9200 init
echo '
systemctl start elasticsearch.service
/data/moloch/bin/moloch_add_user.sh admin admin THEPASSWORD --admin
systemctl start molochcapture.service
systemctl start molochviewer.service
cd /opt/ITSEC/7.Mitm/moloch/aol/moloch 
cat /data/moloch/README.txt
echo user admin pass THEPASSWORD
firefox http://localhost:8005' > moloch.sh
chmod +x moloch.sh
sudo rm -f /usr/local/bin/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE /usr/local/bin/$EXECUTEABLE1
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

# for dependency issues se git repo  easybutton-build.sh script git repo dir


#mkdir -p /opt/ITSEC/7.Mitm/moloch/aol
#cd /opt/ITSEC/7.Mitm/moloch/aol/
#git clone https://github.com/aol/moloch.git
#cd /opt/ITSEC/7.Mitm/moloch/aol/moloch
#git clean -f 
#git fetch origin
#git reset --hard origin/$BRANCH
#git pull
#git submodule init
#git submodule update --recursive
#./configure
#make -j 4
