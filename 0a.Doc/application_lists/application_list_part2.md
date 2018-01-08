This page is an indication only and may be behind the actual routine, check the linked scripts / dirs for changes.

`#` in front of a filename or entry to signal it is disabled
> # Part 2 ..

> ### .. installs dependencies and basic apps
> ## The following applications are being installed in part 2

> - location of the part 2 scripts is /opt/ownsec/0.Initial/src/PT2/ && https://github.com/alphaaurigae/ownsec/tree/master/0.Initial/src/PT2

> - the setup script running those is located here: /opt/ownsec/0.Initial/2.sh && https://github.com/alphaaurigae/ownsec/blob/master/0.Initial/2.sh


* 1.DEB-Lists.sh - runs apt-get lists for the part 3 apps.
* 2.Node-Npm.sh - https://github.com/nodejs/node.git && https://github.com/npm/npm.git
* 3.replace-deb-w-dummy.sh # disabled, no function
* 4.IDE.sh - setup for IDE, curr disabled
* 5.Wifi-Firmware.sh https://github.com/aircrack-ng/rtl8812au && https://github.com/Mange/rtl8192eu-linux-driver
* 6.Java-JDK-JRE.sh http://download.java.net/java/jdk8u152/archive/b03/binaries/jre-8u152-ea-bin-b03-linux-x64-19_apr_2017
* 7.RBENV-RUBY.sh git://github.com/sstephenson/rbenv.git && git://github.com/sstephenson/ruby-build.git && git://github.com/dcarley/rbenv-sudo.git
* 8.Postgres-MSF-DB.sh - configure psql for msf
* 9.Virtualbox.sh - install virtualbox current http://download.virtualbox.org/virtualbox/debian
* 10.OpenSSL-1.1.0.sh # disabled
* 11.Docker.sh install docker - https://download.docker.com/linux/ubuntu
* 12.usr_environment.sh - copy xfce menus etc, symlink start/stop scripts
* 13.dot.sh - setup conky & bash-git-prompt
* 14.GO-gophers-apt.sh - install GO golang-1.9-go - add-apt-repository ppa:gophers/archive
* tor - not part of the install routine yet
