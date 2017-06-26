# ITSEC-Install-Scripts


## BUGS (omg bugs, yeah lots of them - wont stop the script)
 
> somehow default jre is installed during the setup, if its not removed some java programs fail.


## PREQUISITES

- Xubuntu 16.04 

> aprox 2,3 hours of time with 11mbit dl i5 netbook w ssd - apt-get lists, node, openvas (the sync is very slow), wireshark and ruby on rbenv need decent time to dl/build/install.


## INSTALL

`sudo chown -R $USER:$USER /opt`

`cd /opt`

`git clone https://github.com/alphaaurigae/ITSEC-Install-Scripts`

`cd /opt/ITSEC-Install-Scripts/0.Initial`

### Dont run the script as root/sudo - sudo will be prompted if needed.

`./1.sh` Upgrade the system - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT1`


`./2.sh` Install dependencies & tools - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT2`


`./3.sh` Install applications by category - scripts located at `/opt/ITSEC-Install-Scripts/0.Initial/src/PT3`




> or go to `/opt/ITSEC-Install-Scripts/0.Initial/src/PT*` 1-3 and run the respective parts. 


# XFCE Desktop 

![menu](http://i.imgur.com/T8AtF9E.png)



## PART 3 
rec 26.6.17
> Part 3 - 1.Information-Gathering 
<a href="https://asciinema.org/a/h7gFFym7QCS9IUx3ftmBw4mro" target="_blank"><img src="https://asciinema.org/a/h7gFFym7QCS9IUx3ftmBw4mro.png" width="150"/></a>

> 2.Vulnerability-Analysis - asciinema crash

> 3.Exploitation-Tools https://asciinema.org/a/8rSMLOLR5WWuimIuzY5HBkStx

> 4.Password https://asciinema.org/a/XcZq5mryCjEjBvo2fE4PXIFSW

> 5.Database https://asciinema.org/a/p6rcGGpA0joGLH2f6dZsWA87p

> 6.Wireless https://asciinema.org/a/JfuSr0z9IMkJSMydI9fc29bV8

> 7.Mitm https://asciinema.org/a/MsrLiYpAqzLQ79kMSe82ZgYBE

> 8.Tunnel https://asciinema.org/a/jVRefqc8nXXhQKxIuqjHw2bjw

## PART 2 
> Install Dependencies and base applications see `.../0.Initial/src/PT2/` and `.../0.Initial/lst/apt/`.

`cd .../0.Initial/src/ && ./2.sh`

> `.../0.Initial/src/PT2/` Installs from source beside apt package lists:

- node, npm, wifi firmware, java jre/jdk, rbenv/ruby, virtualbox, docker

> Configures XFCE menu & panel, .bashrc, console shortcuts, conky and more - see part2 items ... 

> Part 2 Install dependencies and base apps 23.6.17 ... 
rec 26.6.17
<a href="https://asciinema.org/a/EqaRM6605RBbo25vnPi6BE08c" target="_blank"><img src="https://asciinema.org/a/EqaRM6605RBbo25vnPi6BE08c.png" width="150"/></a>



## PART 1 - 
> Chown git clone dir, clone the repo and start the script for part.

`chown -R $USER:$USER /opt`

`cd /opt/ && git clone && cd Install-Scripts/0.Initial/src && ./1.sh`

> Update && Upgrade the base install of Xubuntu 16.04

- Part 1 asciinema recording 23.6.17 ...
rec 26.6.17
<a href="https://asciinema.org/a/8xbF6r2xYeFVzhnRxlBC74IWf" target="_blank"><img src="https://asciinema.org/a/8xbF6r2xYeFVzhnRxlBC74IWf.png" width="150"/></a>





