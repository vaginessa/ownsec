# ITSEC-Install-Scripts

## BUGS (omg bugs, yeah lots of them - wont stop the script)
- opt and home dir's change ownership to root during part 2 install, does not happen if scripts run without and pw enter on prompt - just dont run as root.


## PREQUISITES

- Xubuntu 16.04 

## INSTALL

`sudo chown -R $USER:$USER /opt`

`cd /opt`

`git clone https://github.com/alphaaurigae/ITSEC-Install-Scripts`

`cd /opt/ITSEC-Install-Scripts/0.Initial`

###Dont run the script as root/sudo - sudo will be prompted if needed.

`./1.sh` Upgrade the system - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT1`


`./2.sh` Install dependencies & tools - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2`


`./3.sh` Install applications by category - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT3`




> or go to `/opt/ITSEC-Install-Scripts/0.Initial/src/PT*` 1-3 and run the respective parts. 


## PART 1 

> Part 1 update/upgrade 23.6.17 ...

<a href="https://asciinema.org/a/UsI7HP7zTjCUPDL6jHOeJ9Kfd" target="_blank"><img src="https://asciinema.org/a/UsI7HP7zTjCUPDL6jHOeJ9Kfd.png" width="250"/></a>


## PART 2 

> Part 2 Install dependencies and base apps 23.6.17 ... 

<a href="https://asciinema.org/a/uVxomq9RM4m9oYqe6riw41iBL" target="_blank"><img src="https://asciinema.org/a/uVxomq9RM4m9oYqe6riw41iBL.png" width="250"/></a>

## PART 3

> Part 3 - 1.Infogather 24.6.17 ... 
<a href="https://asciinema.org/a/hxDRDTbdRlinBgJTXUywe2Vug" target="_blank"><img src="https://asciinema.org/a/hxDRDTbdRlinBgJTXUywe2Vug.png" width="250"/></a>







