## PREQUISITES

- Xubuntu 16.04 

> aprox 2,3 hours of time with 11mbit dl i5 netbook w ssd - apt-get lists, node, openvas (the sync is very slow), wireshark and ruby on rbenv need decent time to dl/build/install.

> documentation on advanced prequisites / customizing is located here: `/opt/ownsec/0a.Doc/advanced_prequisites.md` --> https://github.com/alphaaurigae/ownsec/blob/master/0a.Doc/advanced_prequisites.md

## INSTALL

`sudo chown -R $USER:$USER /opt`

`cd /opt`

`git clone https://github.com/alphaaurigae/ownsec`

`cd ownsec`

	`git submodule init`

	`git submodule update --recursive`

	`sudo updatedb && sudo ldconfig`

`cd /opt/ownsec/0.Initial`

### Dont run the script as root/sudo - sudo will be prompted if needed.

`./1.sh` Upgrade the system - scripts located at `/opt/ownsec/0.Initial/src/PT1`


`./2.sh` Install dependencies & tools - scripts located at `/opt/ownsec/0.Initial/src/PT2`


`./3.sh` Install applications by category - scripts located at `/opt/ownsec/0.Initial/src/PT3`




> or go to `/opt/ownsec/0.Initial/src/PT*` 1-3 and run the respective parts. 
