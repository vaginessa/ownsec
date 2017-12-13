#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/malfunkt/hyperfox.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
GITCLONEDIR=/opt/ITSEC/7.Mitm/hyperfox/malfunkt
EXECUTEABLE1=hyperfox
EXECUTEABLE2=arpfox
EXECUTEABLE3=hyperfox-w-networking-run.sh
EXECUTEABLE4=hyperfox-revert-networking.sh

GITREPO2=https://github.com/malfunkt/arpfox.git
GITREPOROOT2=/opt/ITSEC/7.Mitm/arpfox/malfunkt/arpfox
GITCLONEDIR2=/opt/ITSEC/7.Mitm/arpfox/malfunkt

BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL1=hyperfox.desktop
DSKTPFL2=arpfox.desktop
DSKTPFL3=hyperfox-w-networking-run.desktop
DSKTPFL4=hyperfox-revert-networking.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo '${bold}
 _   ___   ______  _____ ____  _____ _____  __
| | | \ \ / /  _ \| ____|  _ \|  ___/ _ \ \/ /
| |_| |\ V /| |_) |  _| | |_) | |_ | | | \  / 
|  _  | | | |  __/| |___|  _ <|  _|| |_| /  \ 
|_| |_| |_| |_|   |_____|_| \_\_|   \___/_/\_\
  
      
    _    ____  ____  _____ _____  __
   / \  |  _ \|  _ \|  ___/ _ \ \/ /
  / _ \ | |_) | |_) | |_ | | | \  / 
 / ___ \|  _ <|  __/|  _|| |_| /  \ 
/_/   \_\_| \_\_|   |_|   \___/_/\_\
           
INSTALL
${normal}'

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
#hyperfox
go get github.com/gorilla/mux
go get github.com/malfunkt/hyperfox/lib/plugins/capture
go get github.com/malfunkt/hyperfox/lib/plugins/logger
go get github.com/malfunkt/hyperfox/lib/proxy
go get upper.io/db.v3
go get github.com/mattn/go-sqlite3

#arpfox
go get github.com/malfunkt/iprange
go get github.com/google/gopacket
go get github.com/malfunkt/arpfox/arp
### DEPS END

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

go build 

mkdir -p $GITCLONEDIR2
cd $GITCLONEDIR2
git clone -b $BRANCH $GITREPO2
cd $GITREPOROOT2
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

go build

#cd /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
#curl -sL 'https://raw.githubusercontent.com/malfunkt/hyperfox/$BRANCH/install.sh' | sudo sh
#curl -sL 'https://raw.githubusercontent.com/malfunkt/arpfox/$BRANCH/install.sh' | sudo sh

##################################  INSTALL HYPERFOX
#go build
#go install 

#go get github.com/malfunkt/arpfox
#go get github.com/malfunkt/hyperfox

#export PATH=$GOPATH/bin:$PATH
#echo "export GOPATH=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox" >> /home/$USER/.profile
#source /home/$USER/.profile
##################################  end INSTALL HYPERFOX

##################################  CREATE SH - START PORT FORWARD & PREROUTING | launch hyperfox
################ launch hyperfox with networking
echo '#!/bin/bash

#export PATH=$GOPATH/bin:$PATH

#########
read -p "Enter GATEWAY-IP ex 10.0.0.1: " HYPERFOX_GW
read -p "Enter IFACE ex wlan0: " HYPERFOX_IFACE 
read -p "Enter TARGET ex 10.0.0.143: " HYPERFOX_TARGET

sudo sysctl -w net.ipv4.ip_forward=1
# sudo sysctl -w net.ipv6.conf.br0.forwarding=1
# sysctl -w net.ipv6.conf.default.forwarding=0
# sysctl -w net.ipv6.conf.all.forwarding=0

sudo iptables -t nat -A PREROUTING -p tcp --destination-port 80 -i $HYPERFOX_IFACE -j REDIRECT --to-port 1080

sudo screen -d -m xterm -hold -e "sudo /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/hyperfox" 
sudo screen -d -m xterm -hold -e "sudo /opt/ITSEC/7.Mitm/arpfox/malfunkt/arpfox/arpfox -i $HYPERFOX_IFACE -t $HYPERFOX_TARGET $HYPERFOX_GW"


echo "networking port forward & prerouting has been setup"
echo "run hyperfox-revert-networking.sh to revert changes"
echo "hyperfox & arpfox running in detached screen sessions"
echo "screen -h"
echo "This Script is located at /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/hyperfox-w-networking-run.sh"

screen -r

' > $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE3
################################## end CREATE SH - START PORT

################################## DISABLE PORT FORWARD & PREROUTING
echo '#!/bin/bash
echo "disable port forwarding & prerouting"
sudo sysctl net.ipv4.ip_forward
sudo iptables -L -vt nat 
read -p "Enter IFACE to remove ex wlan0: " HYPERFOX_IFACE 


sudo iptables -t nat -D PREROUTING -p tcp --destination-port 80 -i $HYPERFOX_IFACE -j REDIRECT --to-port 1080
sudo sysctl -w net.ipv4.ip_forward=0
sudo iptables -L -vt nat
sudo sysctl net.ipv4.ip_forward

' > $GITREPOROOT/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE4
################################## end DISABLE

################################## LINKING
sudo rm -f $BINDIR/$EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE4 $BINDIR/$EXECUTEABLE4
mkdir -p $DSKTPFLSDEST
sudo rm -f $DSKTPFLSDEST/$DSKTPFL1
sudo rm -f $DSKTPFLSDEST/$DSKTPFL2
sudo rm -f $DSKTPFLSDEST/$DSKTPFL3
sudo rm -f $DSKTPFLSDEST/$DSKTPFL4
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL3
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL4
################################## end LINKING
