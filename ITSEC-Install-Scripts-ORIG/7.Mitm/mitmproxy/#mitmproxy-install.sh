installed with apt
does not work - build fail 


#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

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


mkdir -p /opt/ITSEC/7.Mitm/mitmproxy/mitmproxy
cd /opt/ITSEC/7.Mitm/mitmproxy/mitmproxy
git clone https://github.com/mitmproxy/mitmproxy.git

### DEPS:
# no deps noted, feel free to add ...
### DEPS END
