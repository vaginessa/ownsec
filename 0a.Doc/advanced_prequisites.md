# Advanced Prequisites
work in progress ...
## How / where to start customizing

### Basic Applications & User Environment Customization

The pinpoint to start customizing is Part 2, precisely this dir `/opt/ownsec/0.Initial`
The Directory Names & Filenames are intuitive / selfexplaining.

> Files with Keyword "Deps" are installaing or configuring dependencies for Applications of Part 2 but mainly Part 3. 

- XFCE and dotfile configs are located here: `/opt/ownsec/0.Initial/usrlcl` and related settings scripts which are copied to $USER or used during installation are here `/opt/ownsec/0.Initial/settings-scripts`

- `/opt/ownsec/0.Initial/src/` Contains the grouping of install scripts for each part, for details see next points.


### Customization Checklist Part 2 - Deps, Base Apps & USR-Env:

> `/opt/ownsec/0.Initial/src/PT2` Contains the scripts which coordinate part 2 - Part 2 master script the user runs for part 2 is `/opt/ownsec/0.Initial/2.sh`

1. `/opt/ownsec/0.Initial/src/PT2/1.Deps_Install` Installation Scripts for Apps & Package-Mgr Packets which satisfy Dependencies, for example Ruby, Go, Node - Apps that should be installed from source or are not available through packet manager etc..
- (Package Mgr Lists for Deps are here `/opt/ownsec/0.Initial/lst/`)

2. `/opt/ownsec/0.Initial/src/PT2/2.Firmware_Install` Firmwares for Hardware go here `../1.Wifi` has some Wifi drivers.

3. `/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install` User Apps which are not serving as Dependencies, for example Virtualbox - Apps that should be installed from source or are not available through packet manager etc

4. `/opt/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup` These Scripts coordinate the UserEnv Setup. The following dirs are related/used w/by the Scripts `/opt/ownsec/0.Initial/settings-scripts` && `/opt/ownsec/0.Initial/usrlcl`

> Any changes have to be synced with the PT2 Master script (The script the $USER runs for the respective part) which is located here: `/opt/ownsec/0.Initial/` `2.sh`


### Customization Checklist Part 3 - The Main Apps located in the Main Categories:
#### Adding / Removing an Application

> `/opt/ownsec/0.Initial/src/PT3` Contains the scripts which coordinate part 3 - Part 3 master script the user runs for part 3 is `/opt/ownsec/0.Initial/3.sh`

1. Get the Template which is located here: `/opt/ownsec/0a.Doc/templates/Main-APP`
- 1.1 Add the XFCE menu category if theres a new one for the app `/opt/ownsec/0.Initial/usrlcl/.config/menus/xfce-applications.menu`

2. Create the directory under the desired category, for example `/opt/ownsec/6.Wireless/1.Wifi/aircrack-ng`, filenames go as `$appname-install` && `$appname-update` + a package mgr list file FE `deps-$appname`

3. If theres a package-mgr list, link it in `/opt/ownsec/0.Initial/src/PT2/1.Deps_Install/1.Package-Mgr_Lists_Install.sh`

4. If theres a standalone app to satisfy the deps of the app to be added, put the script here `/opt/ownsec/0.Initial/src/PT2/1.Deps_Install`, sync `/opt/ownsec/0.Initial/2.sh` accordingly to include the dependency app.
- 4.1 scripts for symlinks of services go here `/opt/ownsec/0.Initial/settings-scripts/startstop/0.Services` - w the following link you make sure the symlinks are set during part 2 `/opt/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup/1.Symlinks_Setup.sh` 
- 4.2 edit the XFCE menu to include the service category `/opt/ownsec/0.Initial/usrlcl/.config/menus/xfce-applications.menu`

5. Sync the respective category file for your app here `/opt/ownsec/0.Initial/src/PT3` to run the installation script of your app.

6. Sync here as well for the update script `/opt/ownsec/00.Maintain/update-lists/PT3-update-lists` - so that later updates work flawlessly.

7. Sync the Part 3 master script `/opt/ownsec/0.Initial/3.sh` in case a category was added.
