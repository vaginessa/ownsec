#!/bin/bash
############################# INSTALL JAVA8 START #############################

#Oracle (http://www.oracle.com/technetwork/java/javase/downloads):
#    The Java Development Kit (JDK), version 6, 7 and 8
#    The Java Runtime Environment (JRE), version 6, 7 and 8
#    The Java API Javadoc, version 6, 7 and 8 
# EARLY RELEASE
#http://jdk.java.net/8/


sudo apt-get update && sudo apt-get upgrade
sudo apt-get install java-package

mkdir -p /opt/DEPS/Java
cd /opt/DEPS/Java
mkdir java8_install-setup
cd java8_install-setup


mkdir jre8
cd jre8
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
cat jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
sha256sum jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
make-jpkg jre-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
sudo dpkg -i oracle-java8-jre_8u152~ea-build-b03_amd64.deb
cd ..

mkdir jdk8
cd jdk8
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
wget http://download.java.net/java/jdk8u152/archive/b03/binaries/jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
cat jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.sha256
sha256sum jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
make-jpkg jdk-8u152-ea-bin-b03-linux-x64-19_apr_2017.tar.gz
sudo dpkg -i oracle-java8-jdk_8u152~ea-build-b03_amd64.deb
cd ..

java -version

############################# INSTALL JAVA8 END #############################