## STATUS: 
> See git-root for patch files, ill try to write them to adopt changes so that a complete wipe and reinstall is not nessecary. 

> So to say a development branch, updates daily at random times. to fetch latest updates make sure to cp https://github.com/alphaaurigae/ITSEC-Install-Scripts/tree/master/0.Initial/usrlcl to $USER. Depending if categories get reshuffled, it might be nessary to remove ihe respective /opt/ITSEC/ dirs to avoid stacking files - the installer overwrite symlinks and desktop files, that not a problem.

> Ive bookmarked quite a few interesting apps to be added, however, ill probably first make the reinstall script for each existing app.
# ITSEC-Install-Scripts

> A set of bash scripts to dl, build and install ITsec related soft from source & its dependencies on 16.04 Xfce -. menu/console entries and and pre config - semi unattended(yet)

## XFCE Desktop 

https://github.com/alphaaurigae/ITSEC-Install-Scripts/wiki/Menu-Screenshots

### Panel Screenshot ...
![menu](http://i.imgur.com/hUs1wM1.png)



### TODO

- build "reinstall/update" scripts and possibly link console / menu 

- phishingfrenzy depends mysql-server - not installed during setup

- mysql-server && phpmyadmin unattended install during part 2

- phppgadmin menu link

- nginx install for fruitywifi wants userinteraction.

- menu links for itsec packages installed by default apt and auto cp during part to as done w crunch.

- test everything ....

### BUGS
 
> Somehow default jre is installed during the setup, if its not removed some java programs fail.

> At aprox the middle of part 2 node/npm ask for sudo, just after the node make - thats ugly bec else only macchanger in the beginning asks for prompt.

> #probably fixed now . fruitywifi nginx setup
### Install all the scripts ...

https://github.com/alphaaurigae/ITSEC-Install-Scripts/wiki/Install






