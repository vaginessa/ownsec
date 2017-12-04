#!/bin/bash

# This script runs the scripts containing the links to the update scripts, sorted by category. Additionally making a symlink for future updates.
# To modify teh update lists go t othe linked scripts ...

cd /opt/ITSEC-Install-Scripts/00.Maintain/update-lists

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

cd /opt/ITSEC-Install-Scripts/00.Maintain
chmod +x updatealltehgits.sh
sudo rm -f /usr/local/bin/updatealltehgits.sh
sudo ln -s /opt/ITSEC-Install-Scripts/00.Maintain/updatealltehgits.sh /usr/local/bin/updatealltehgits.sh
