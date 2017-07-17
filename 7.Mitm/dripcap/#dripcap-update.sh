#does not work - node problem

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  ___ ____   ____    _    ____  
|  _ \|  _ \|_ _|  _ \ / ___|  / \  |  _ \ 
| | | | |_) || || |_) | |     / _ \ | |_) |
| |_| |  _ < | ||  __/| |___ / ___ \|  __/ 
|____/|_| \_\___|_|    \____/_/   \_\_|    
             
${normal}"




git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive