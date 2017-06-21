#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
cd /opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
git clone https://github.com/byt3bl33d3r/sslstrip2.git

cd /opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2

git clean -f 
git pull
git submodule init
git submodule update --recursive
sudo python setup.py install