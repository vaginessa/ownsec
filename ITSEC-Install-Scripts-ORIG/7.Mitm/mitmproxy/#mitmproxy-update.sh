does not work - build fail


bold=$(tput bold)
normal=$(tput sgr0)

BRANCH=master
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mit/mitmproxy
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/mitmproxy
DSKTPFL=mitmproxy.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/mitmproxy

echo "${bold}
 __  __ ___ _____ __  __ ____  ____   _____  ____   __
|  \/  |_ _|_   _|  \/  |  _ \|  _ \ / _ \ \/ /\ \ / /
| |\/| || |  | | | |\/| | |_) | |_) | | | \  /  \ V / 
| |  | || |  | | | |  | |  __/|  _ <| |_| /  \   | |  
|_|  |_|___| |_| |_|  |_|_|   |_| \_\\___/_/\_\  |_|  
          
${normal}"


if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/mitmproxy/mitmproxy
cd /opt/ITSEC/7.Mitm/mitmproxy/mitmproxy
git clone https://github.com/mitmproxy/mitmproxy.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd /opt/ITSEC/7.Mitm/mitmproxy
git clean -f 
git fetch origin
git reset --hard origin/$BRANCH
git pull
git submodule init
git submodule update --recursive

fi

