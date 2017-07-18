#!/bin/bash

### update all the git repos

## git status check to be implemented - else update take way too long 
#### https://stackoverflow.com/questions/5143795/how-can-i-check-in-a-bash-script-if-my-local-git-repo-has-changes

cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/update-allthethings

./UPDATE-1.Information-Gathering.sh
./UPDATE-2.Vulnerability-Scanner.sh
./UPDATE-3.Exploitation-Tools.sh
./UPDATE-4.Password.sh
./UPDATE-5.Database.sh
./UPDATE-6.Wireless.sh
./UPDATE-7.Mitm.sh
./UPDATE-8.Tunnel.sh
./UPDATE-9.Maintain-Access.sh
./UPDATE-10.Stresstest.sh
#./UPDATE-12.Forensics.sh

chmod +x updatealltehgits.sh
sudo ln -s updatealltehgits.sh /usr/local/bin/updatealltehgits.sh
