#!/bin/bash

sudo service apache2 stop
sudo service apache2 status


sudo service php7.0-fpm stop
sudo service php7.0-fpm status

sudo service mysql stop
sudo service mysql status
