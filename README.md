## STATUS: 

TODO:
Tidy up, add some of the starred repos, may remove some, fix initial setup bugs so that everything works out of the box again.

last tested & fixed 22.10.17 - minor bugs, "works" :)
- bettercap 
- msf ruby version, not sure what went wrong - tough works running bundler after reboot.

11.11.17
added some rootkits , git clone into /opt/ITSEC/9.Maintain-Access/3.Rootkit/ 
folder accessible through menu 9.Maintain-Access/3.Rootkit/

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






