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



#sudo update-rc.d -f redis-server remove
#sudo update-rc.d -f tor remove
#sudo update-rc.d -f polipo remove
#sudo update-rc.d -f privoxy remove
#sudo update-rc.d -f postgresql remove
#sudo update-rc.d -f apache2 remove
#sudo update-rc.d -f nginx remove
#sudo update-rc.d -f lighttpd remove
#sudo update-rc.d -f bluetooth remove
#sudo update-rc.d -f gpsd remove
#sudo update-rc.d -f cups remove
#sudo update-rc.d -f cups-browsed remove
#sudo update-rc.d -f saned remove
#sudo update-rc.d -f dnsmasq remove
#sudo update-rc.d -f mysql remove
#sudo update-rc.d -f php7.0-fpm remove