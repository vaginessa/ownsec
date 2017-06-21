#!/bin/bash

sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get install expect tcl-expect-dev 

sudo udpatedb
sudo ldconfig 

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/automate-wifi/airgeddon/v1s1t0r1sh3r3
cd /opt/ITSEC/6.Wireless/1.Wifi/automate-wifi/airgeddon/v1s1t0r1sh3r3
git clone https://github.com/v1s1t0r1sh3r3/airgeddon




cd /opt/ITSEC/6.Wireless/1.Wifi/automate-wifi/airgeddon/v1s1t0r1sh3r3/airgeddon

chmod +x airgeddon.sh
