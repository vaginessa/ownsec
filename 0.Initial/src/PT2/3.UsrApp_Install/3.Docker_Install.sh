#!/bin/bash
sudo updatedb
sudo ldconfig

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   ___   ____ _  _______ ____  
|  _ \ / _ \ / ___| |/ / ____|  _ \ 
| | | | | | | |   | ' /|  _| | |_) |
| |_| | |_| | |___| . \| |___|  _ < 
|____/ \___/ \____|_|\_\_____|_| \_\
          
${normal}"


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo "Verify: 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
echo "https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" 
 cd ~
sudo apt-get update
sudo apt-get install -y docker-ce
#sudo docker run hello-world
sudo gpasswd -a $USER docker
#newgrp docker
