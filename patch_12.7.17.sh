#!/bin/bash

# run if installed < 12.7.17 

sudo rm -r /home/tux/.local/share/applications/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce
sudo rm -r /home/tux/.local/share/applications/2.Vulnerability-Scanner/3.Fuzzer
sudo rm -r /home/tux/.local/share/applications/3.Exploitation-Tools/3.LFI-RFI
sudo rm -r /opt/ITSEC/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce
sudo rm -r /opt/ITSEC/2.Vulnerability-Scanner/3.Fuzzer
sudo rm -r /opt/ITSEC/3.Exploitation-Tools/3.LFI-RFI

cp /opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.config/menus/xfce-applications.menu /home/tux/.config/menus/xfce-applications.menu

cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/15.Fuzzer
./dotdotpwn.sh 
./simplefuzzer.sh # call w sfuzz 
./siparmyknife.sh 
./dirb.sh
#
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI
./fimap.sh 
./kadabra.sh 
./kadimus.sh 
./lfifreak.sh 
./liffy.sh 