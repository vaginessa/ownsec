installed with apt
does not work - build fail 


bold=$(tput bold)
normal=$(tput sgr0)

BRANCH=master

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
