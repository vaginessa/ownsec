#!/bin/bash

############################# VARIABLES START #############################
initdir=/opt/ownsec/0.Initial
chkdir=/opt/ownsec/0.Initial/src
chkfile1=rebootchkPT1.txt
chkfile2=rebootchkPT2.txt
chkfile3=rebootchkPT3.txt
############################# STATIC FUNCTIONS START #############################
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\e[32m ${bold}
 ______        ___   _   ____  _   _ 
|  _ \ \      / / \ | | / ___|| | | |
| |_) \ \ /\ / /|  \| | \___ \| |_| |
|  __/ \ V  V / | |\  |_ ___) |  _  |
|_|     \_/\_/  |_| \_(_)____/|_| |_|
                                                    
\e[0m ${normal}"
echo ""
echo -e "${bold}\e[32m SCRIPT IS BUILD ON 4.8.0-53-generic #54~ 16.04.2 LTS (Xenial Xerus) \e[0m${normal}"
echo ""
echo "${bold}YOUR SYSTEM:${normal}"
sudo uname -r
sudo lsb_release -a
echo ""

read -r -p "${bold}DID YOU READ THE DOCUMENTATION README? ${normal}[Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

read -r -p "${bold}DID YOU CONFIG THE WLAN FIRMWARE SECTION /opt/ownsec/0.Initial/src/PT2/ ? ${normal}[Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

read -r -p "${bold}DID CONFIG THE IDE SECTION /opt/ownsec/0.Initial/src/PT2/ ? ${normal}[Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

read -r -p "${bold}We are going to reboot multiple times, are you fine with that? ${normal}[Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

read -r -p "${bold}Programs that will be installed, may be only partly configured or have no working conole or desktop entry, are you fine with that ? ${normal}[Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

read -r -p "${bold}You will need to confirm multiple times during installations unless you set the apt / pip installations to auto, are you fine with that ? ${normal}[Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

read -r -p " ${bold}   Turn lighting amber, ALL SYSTEMS GO? PWN???  ${normal} [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then

#echo "[Desktop Entry]
# Type=Application
# Exec=/opt/ownsec/pwn.sh
# Name=pwn
# Comment=autoinstallITSEC" >> ~/.config/autostart/pwn-sh.desktop

echo -e "\e[31m welcome, thx4playing :)\e[0m"
cd $chkdir

# Determine if PT1 completed, if continue to PT2, else start PT1.
if [ -f $chkfile1 ]; then
	echo "PT1 complete, proceeding for check if PT2 complete"

   	if [ -f $chkfile2 ]; then
		cd $initdir start
		echo "PT2 complete, checking if PT3 complete"
		cd $chkdir
			if [ -f $chkfile3 ]; then
				cd $initdir
				echo "PT3 complete, done"
				#sudo update-rc.d pwndat disable
				#rm ~/.config/autostart/pwn-sh.desktop
			else
				cd $initdir
				echo "PT3 not complete, proceeding with PT3"
				./3.sh
			fi	
	else
		cd $initdir
		echo "PT2 not complete, proceeding for PT2"
		./2.sh
	fi
else
	cd $chkdir
	# Determine if PT2 completed, if continue to PT3, else do nothing.
	if [ -f $chkfile2 ]; then
		cd $initdir	
		echo "PT2 complete, proceeding with PT3"
		./3.sh
	else
		cd $initdir
		echo "PT1 not complete yet, proceeding with PT1"
		./1.sh
	fi
fi

else
echo -e "\e[31mABORTED\e[0m"
fi

else
echo -e "\e[31mABORTED\e[0m"
fi

else
echo -e "\e[31mABORTED\e[0m"
fi

else
echo -e "\e[31mABORTED\e[0m"
fi

else
echo -e "\e[31mABORTED\e[0m"
fi

else
echo -e "\e[31mABORTED\e[0m"
fi

echo "I LOVE CUPCAKES"
else
echo -e "\e[31mABORTED\e[0m"
fi
