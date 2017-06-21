#!/bin/bash
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
sudo chown -R $USER:$USER /opt
cd /opt/DEPS/Java/java8_install-setup


mkdir jre8
sudo chown -R $USER:$USER /opt
cd jre8
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
cat jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
sha256sum jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
yes "Y" | make-jpkg jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
yes "Y" | sudo dpkg --force -i oracle-java8-jre_8u152~ea-build-b03_amd64.deb 
##!/usr/bin#/expect

#spawn dpkg-reconfigure firebird2.5-superclassic -freadline
#expect "Is this correct [Y/n]:"
#send "Y\r"

#expect "Press [Return] to continue:"
#send "newpwd\r"

# done
#expect eof

cd /opt/DEPS/Java/java8_install-setup

mkdir jdk8
sudo chown -R $USER:$USER /opt
cd jdk8
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
#wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
cat jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
sha256sum jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
yes "Y" | make-jpkg jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
yes "Y" | sudo dpkg --force -i oracle-java8-jdk_8u152~ea-build-b03_amd64.deb 
cd ..

java -version