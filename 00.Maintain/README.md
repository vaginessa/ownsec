# Maintain 

## INCOMPLETE - not all apps from part2 are included yet.

The update script(s) fetch the latest updates from git without reinstalling every app for no reason.


The update scripts check with if functions for changes on the tracking branch, if there are changes the script run a pull, cleanup and reinstallation of the repo.
This only works for the git repos of course, apps from other soruces ned manual update and or upgrade. Openvas for example only needs upgrades manually, updates work automatically.

run the update script and udpate all git repositories proceed as follows:



cd /opt/ownsec/00.Maintain

./updatealltehgits.sh



the script will create a symlink, for future updates run
~$ updatealltehgits.sh from any place.

to disable/enable/add/remove apps from the update process edit the respective update list file located here:
/opt/ownsec/00.Maintain/update-lists


