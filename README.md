# ITSEC-Install-Scripts

### Install all the things - mostly unattended

pre 21.06.2017 downloads need to hardfork, delete the install-scripts dir and git pull again.

## PREQUISITES

- Blanc `16.04.2` based OS, build system is Xubuntu.
- Current size of all installed apps aprox 19GB, havent measured how much bandwidth required 

## INSTALL

`sudo chown -R $USER:$USER /opt`

`git clone https://github.com/alphaaurigae/ITSEC-Install-Scripts`

`cd /opt/ITSEC-Install-Scripts`

`cd /opt/ITSEC-Install-Scripts/0.Initial`

`sudo ./1.sh` Upgrade the system - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT1`

`sudo ./2.sh` Install dependencies & tools - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2`

`sudo ./3.sh` Install applications by category - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT3`


or go to `/opt/ITSEC-Install-Scripts/0.Initial/src/PT*` 1-3 and run the respective parts. 

## PART 1 


## PART 2 



## PART 3




