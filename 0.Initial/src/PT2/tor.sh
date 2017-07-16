#!/bin/bash

sudo cp /etc/apt/sources.list.d /etc/apt/sources.list.d.backup
#sudo echo "deb http://deb.torproject.org/torproject.org xenial main" >> /etc/apt/sources.list.d/tor
#sudo echo "deb-src http://deb.torproject.org/torproject.org xenial main" >> /etc/apt/sources.list.d/tor
echo "deb http://deb.torproject.org/torproject.org xenial main" | sudo tee -a /etc/apt/sources.list.d/tor.list
echo "deb-src http://deb.torproject.org/torproject.org xenial main" | sudo tee -a /etc/apt/sources.list.d/tor.list

gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

sudo apt-get update
sudo apt-get install tor deb.torproject.org-keyring

