#!/bin/bash

# https://github.com/golang/go/wiki/Ubuntu

sudo apt-get update
sudo apt-get upgrade
sudo add-apt-repository ppa:gophers/archive
sudo apt get update
sudo apt-get install golang-1.9-go
sudo updatedb
sudo ldconfig
