# ITSEC-Install-Scripts

## BUGS (omg bugs, yeah lots of them - wont stop the script)
- MYSQL-SERVER & PHPMYADMIN not fully unattended setup yet
- nginx setup maybe not working, only needed for fruitywifi, be fixed later.
- opt and home dir's change ownership to root during part 2 install, does not happen if scripts run without and pw enter on prompt - just dont run as root.


## PREQUISITES

- Xubuntu 16.04 

## INSTALL

`sudo chown -R $USER:$USER /opt`

`git clone https://github.com/alphaaurigae/ITSEC-Install-Scripts`

`cd /opt/ITSEC-Install-Scripts`

`cd /opt/ITSEC-Install-Scripts/0.Initial`

###Dont run the script as root/sudo - sudo will be prompted if needed.
`./1.sh` Upgrade the system - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT1`

`./2.sh` Install dependencies & tools - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2`

`./3.sh` Install applications by category - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT3`


or go to `/opt/ITSEC-Install-Scripts/0.Initial/src/PT*` 1-3 and run the respective parts. 


## PART 1 


## PART 2 


## PART 3




