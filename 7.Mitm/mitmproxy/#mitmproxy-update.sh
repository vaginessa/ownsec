does not work - build fail


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __ ___ _____ __  __ ____  ____   _____  ____   __
|  \/  |_ _|_   _|  \/  |  _ \|  _ \ / _ \ \/ /\ \ / /
| |\/| || |  | | | |\/| | |_) | |_) | | | \  /  \ V / 
| |  | || |  | | | |  | |  __/|  _ <| |_| /  \   | |  
|_|  |_|___| |_| |_|  |_|_|   |_| \_\\___/_/\_\  |_|  
          
${normal}"

cd /opt/ITSEC/7.Mitm/mitmproxy
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

