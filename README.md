
pre 21.06.2017 downloads need to hardfork, delete the install-scripts dir and git pull again.
## PREQUISITES

- Blanc `16.04.2` based OS, build system is Xubuntu.
- Current size of all installed apps aprox 19GB, havent measured how much bandwidth required 

## INSTALL

`sudo chown -R $USER:$USER /opt`

`git clone https://github.com/alphaaurigae/ITSEC-Install-Scripts`
`cd /opt/ITSEC-Install-Scripts`

from here there are two ways - install everything by running 

`sudo ./pwn.sh` # probably needs remake, meanwhile proceed ...
or 

`cd /opt/ITSEC-Install-Scripts/0.Initial`
and run the reboot parts one by one - 
which is 
`sudo ./1.sh` upgrade the system
`sudo ./2.sh` install dependencies & tools - located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2`
`sudo ./3.sh` to install the ITSEC applications by category.

## PART 1 

Part 1 simply upgrades the system, reboots if enabled in "`/opt/ITSEC-Install-Scripts/0.Initial/src/PT1/1-Upgrade.sh`", 
and writes reboot file if enabled in   "`/opt/ITSEC-Install-Scripts/0.Initial/1.sh`

Part 1 relevant files:
 - upgade process
`/opt/ITSEC-Install-Scripts/0.Initial/src/PT1/1-Upgrade.sh`

 - reboot checkfile, written by `/opt/ITSEC-Install-Scripts/0.Initial/1.sh`"
`/opt/ITSEC-Install-Scripts/0.Initial/src/rebootchkPT1.txt`

- runs `/opt/ITSEC-Install-Scripts/0.Initial/src/PT1/...` & writes reboot file
`/opt/ITSEC-Install-Scripts/0.Initial/1.sh`


## PART 2 

Here you customize the installation with your on WIFI driver `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/5.Wifi-Firmware.sh`
and IDE `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/4.IDE.sh` - just uncomment if you dont need neither.

1. Runs all scripts located in `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2` .
1.1 Writes reboot file to `/opt/ITSEC-Install-Scripts/0.Initial/src/rebootchkPT2.txt` . if enabled in `/opt/ITSEC-Install-Scripts/0.Initial/2.sh` ,
1.2 Copies `/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/` config files to `/home/$USER` - these are panel and menu settings copied from the dev box.
1.3 Configures Databases & Webserver
1.4 Disables System Services

- Virtualbox extensions (not guest additions) need manual install but are downloaded to `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-5.1.22-115126.vbox-extpack`
- Node make process takes ~ 15 minutes on a netbook i5 w 4 gig ram. Some apps still need that.


## PART 3

1. Runs all scripts located in `/opt/ITSEC-Install-Scripts/0.Initial/src/PT3` which are Pentest appy by Categories .
 These scripts all all the app install scripts in `/opt/ITSEC-Install-Scripts 1-x`



