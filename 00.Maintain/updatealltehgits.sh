#!/bin/bash

# This script runs the scripts containing the links to the update scripts, sorted by category. Additionally making a symlink for future updates.
# To modify teh update lists go t othe linked scripts ...
cd /opt/ownsec/00.Maintain/update-lists/PT2-update-lists/1.Deps_Update
./1.Package-Mgr-Lists_Install.sh
./2.Node-Npm-update.sh

cd /opt/ownsec/00.Maintain/update-lists/PT2-update-lists/2.Firmware_Update/1.Wifi
./1.RTL_8812_update.sh
./1.RTL_8192_update.sh

cd /opt/ownsec/00.Maintain/update-lists/PT3-update-lists
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

cd /opt/ownsec/00.Maintain
chmod +x updatealltehgits.sh
sudo rm -f /usr/local/bin/updatealltehgits.sh
sudo ln -s /opt/ownsec/00.Maintain/updatealltehgits.sh /usr/local/bin/updatealltehgits.sh
