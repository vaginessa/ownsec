#!/bin/bash


# Install Glide 
# Package Management for Golang https://glide.sh
# https://github.com/Masterminds/glide

yes Y | sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update
sudo apt-get install glide
