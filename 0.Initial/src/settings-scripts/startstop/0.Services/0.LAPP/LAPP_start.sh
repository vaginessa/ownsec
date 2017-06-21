#!/bin/bash

sudo service apache2 start
sudo service apache2 status

sudo service php7.0-fpm start
sudo service php7.0-fpm status

sudo service postgresql start
sudo service postgresql status

