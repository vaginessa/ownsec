#!/bin/bash


VERSION1=4.7
VERSION2=4.8
VERSION3=4.9
VERSION4=5

# clean up, update & upgrade
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
sudo updatedb
sudo ldconfig
sudo rm -rf ~/.local/share/Trash/*
uname -r

sudo apt-get install gcc-4.7 gcc-4.8 gcc-4.9 gcc-5 g++-4.7 g++-4.8 g++-4.9 g++-5


dpkg --list | grep compiler

sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION1 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION2 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION3 30
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION4 40

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION1 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION2 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION3 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION4 40

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 50
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 50
sudo update-alternatives --set c++ /usr/bin/g++

sudo update-alternatives --config gcc
sudo update-alternatives --config g++