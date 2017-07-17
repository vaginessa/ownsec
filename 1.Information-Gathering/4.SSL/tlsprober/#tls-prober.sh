#unfinished
#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _     ____  ____  ____   ___  ____  _____ ____  
|_   _| |   / ___||  _ \|  _ \ / _ \| __ )| ____|  _ \ 
  | | | |   \___ \| |_) | |_) | | | |  _ \|  _| | |_) |
  | | | |___ ___) |  __/|  _ <| |_| | |_) | |___|  _ < 
  |_| |_____|____/|_|   |_| \_\\___/|____/|_____|_| \_\
             
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd
cd /opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd
git clone https://github.com/WestpointLtd/tls_prober.git


cd /opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd/tls_prober

git clean -f
git pull

git submodule init
git submodule update --recursive


