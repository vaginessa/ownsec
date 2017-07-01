#!/bin/bash

sudo systemctl disable redis-server.service
sudo systemctl disable tor.service
sudo systemctl disable polipo.service
sudo systemctl disable privoxy.service
sudo systemctl disable postgresql.service
sudo systemctl disable apache2.service
sudo systemctl disable nginx.service
sudo systemctl disable lighttpd.service
sudo systemctl disable bluetooth.service
sudo systemctl disable gpsd.service
sudo systemctl disable cups.service
sudo systemctl disable cups-browsed.service
sudo systemctl disable saned.service
sudo systemctl disable dnsmasq.service
sudo systemctl disable mysql.service 
sudo systemctl disable php7.0-fpm.service 
sudo systemctl disable docker.service 

