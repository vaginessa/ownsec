#!/bin/bash

sudo service apache2 stop
sudo service apache2 status

sudo service php7.0-fpm stop
sudo service php7.0-fpm status

sudo service postgresql stop
sudo service postgresql status
