Keywords:
dependency applplications = applications installed during part 2 which either serve as dependencies, base applications.


# 1. add/modify dependencies & base applications for the install process and xfce user environment.


Structure:

## 1.1 Dependency applications

Adding a main application like aircrack-ng

1. Setup dependency scripts for part 2 - Everything related is located under ../0.Initial
The structure is described below. Dependency scripts go here: ../0.Initial/src/PT2
2. Update ../0.Initial/2.sh to include dependency scripts.
3. Create a application installation and update template in the respective main catgory or create one. Template files located here: 
../0a.Doc/templates/
4. Create .desktop file(s) and place them in the respective directory:
../0.Initial/usrlcl/.local/share/applications
5. Start / stop scripts for the service menu go here: 
../0.Initial/settings-scripts/startstop
6. XFCE menu can be adjusted here:
../0.Initial/usrlcl/.config/menus/xfce-applications.menu
7. Update the update script lists here to include the app:
/opt/ITSEC-Install-Scripts/00.Maintain/updatealltehgits.sh
8. Update the part 3 script(s) of the respective category(ies of your added app:
../0.Initial/src/PT3

### 1.1.1 Adding dependency applications

Dependency & base applications Installation scripts 
../0.Initial/src/PT2

... and linked in ...: 
../0.Initial/2.sh


### 1.1.2 Dependencies installed by packet manager ../0.Initial/lst

Packet Manager Lists: 
../0.Initial/lst

The packet manager lists are installed during part 2.

script which calls the lists is located here: 
../0.Initial/src/PT2/1.DEB-Lists.sh

Every *(work in progress) application in the repository which has dependencies satisfied by packet managers, has its own list in the respective directory.
Example:
../0.Initial/lst/apt/deps-aircrack-ng.txt 
holds the apt-get packet names to satisfy aircrack-ng dependencies.

../0.Initial/src/PT2/1.DEB-Lists.sh runs apt-get install for every application in this list. 
The following command runs the installation: xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-aircrack-ng.txt") -r -- sudo apt-get install -y


### 1.1.3 User Environment - scripts, symlinks etc ... ../0.Initial/lst

../0.Initial/settings-scripts

#### 1.1.3.1 disable-services

../0.Initial/src/settings-scripts/disable-services

Part of the XFCE menu 0.services, bash script to disable all running services at once.

#### 1.1.3.2 replace-aptpack-for-sourcegit

remaining from non existing setup, not in use.

#### 1.1.3.3 startstop

start / stop script for the XFCE menu 0.services

#### 1.1.3.4 this-repo

scripts for this repo, work in progress


### 1.1.4 User Environment local .dotfiles ../0.Initial/usr

../0.Initial/usrlcl


# Examples:

# 1. Aircrack-ng 

1. ../0.Initial/lst/apt/deps-aircrack-ng.txt # apt-get packet list to satisfy dependencies
2. wifi driver (or whatever standalone app is needed as dependency):
../0.Initial/src/PT2/5.Wifi-Firmware.sh
2. ../ITSEC-Install-Scripts/6.Wireless/1.Wifi/aircrack-ng - main install / update scripts
3. ../0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/aircrack-ng.desktop
.desktop file .
4. ../0.Initial/src/PT3/6.Wireless.sh
5. ../00.Maintain/update-lists/UPDATE-6.Wireless.sh


