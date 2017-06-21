#!/bin/bash
cd /opt/sys-dev-deb/openssl
git clean -f
git checkout OpenSSL_1_1_0-stable
make clean
sudo make uninstall
git pull
git submodule init && git submodule update --recursive

./config -Wl,--enable-new-dtags,-rpath,'$(LIBRPATH)'
make -j 4
make install
#sudo make install

#sudo updatedb
#sudo ldconfig
#openssl version