#!/bin/bash

## 07.03.2018 | not working with current links - disabled and apt repositories used.


############################# INSTALL JAVA8 START #############################

#Oracle (http://www.oracle.com/technetwork/java/javase/downloads):
#    The Java Development Kit (JDK), version 6, 7 and 8
#    The Java Runtime Environment (JRE), version 6, 7 and 8
#    The Java API Javadoc, version 6, 7 and 8 
# EARLY RELEASE
#http://jdk.java.net/8/


#if [ "$RUNNING_IN_NEW_XTERM" != t ] ; then
#        RUNNING_IN_NEW_XTERM=t exec xterm -hold -e ""
#fi


############################# INSTALL JAVA8 END #############################

mkdir -p /opt/DEPS/Java/java8_install-setup

bold=$(tput bold)
normal=$(tput sgr0)

# JRE8 vars
releasename_url_jre=http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jre-8u162-linux-x64
releasename_jre=jre-8u162-linux-x64
dpkgname_jre=oracle-java8-jre_8u162_amd64

# JDK8 vars
releasename_url_jdk=http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64
releasename_jdk=jdk-8u162-linux-x64
dpkgname_jdk=oracle-java8-jdk_8u162_amd64

echo "${bold}
     _ ____  _____ ___  
    | |  _ \| ____( _ ) 
 _  | | |_) |  _| / _ \ 
| |_| |  _ <| |__| (_) |
 \___/|_| \_\_____\___/ 
             
${normal}"

cd /opt/DEPS/Java/java8_install-setup
mkdir jre8
cd jre8
wget $releasename_url_jre.tar.gz
#wget $releasename_url_jre.sha256
#cat $releasename_jre.sha256
#sha256sum $releasename_jre.tar.gz
yes "Y" | make-jpkg $releasename_jre.tar.gz
yes "Y" | sudo dpkg -i $dpkgname_jre.deb 


echo "${bold}
     _ ____  _  _____  
    | |  _ \| |/ ( _ ) 
 _  | | | | | ' // _ \ 
| |_| | |_| | . \ (_) |
 \___/|____/|_|\_\___/ 
            
${normal}"

cd /opt/DEPS/Java/java8_install-setup
mkdir jdk8
cd jdk8
wget $releasename_url_jdk.tar.gz
#wget $releasename_url_jdk.sha256
#cat $releasename_jdk.sha256
#sha256sum $releasename_jre.tar.gz
yes "Y" | make-jpkg $releasename_jdk.tar.gz
yes "Y" | sudo dpkg -i $dpkgname_jdk.deb 
