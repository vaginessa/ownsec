#!/bin/bash -i

bold=$(tput bold)
normal=$(tput sgr0)

RUBYVERSION=$(lynx --dump https://raw.githubusercontent.com/rapid7/metasploit-framework/$BRANCH/.ruby-version )

# RBENV install functions
GITREPO1=git://github.com/sstephenson/rbenv.git
BRANCH1=master
GITREPOROOT1=/home/$USER/.rbenv

# ruby-build install functions
GITREPO1=git://github.com/sstephenson/ruby-build.git
BRANCH2=master
GITREPOROOT2=/home/$USER/.rbenv/plugins/ruby-build

# rbenv-sudo install functions
GITREPO3=git://github.com/dcarley/rbenv-sudo.git
BRANCH3=master
GITREPOROOT3=/home/$USER/.rbenv/plugins/rbenv-sudo

echo "${bold}
 ____  ____  _____ _   ___     __  ____  _   _ ______   __
|  _ \| __ )| ____| \ | \ \   / / |  _ \| | | | __ ) \ / /
| |_) |  _ \|  _| |  \| |\ \ / /  | |_) | | | |  _ \\ V / 
|  _ <| |_) | |___| |\  | \ V /   |  _ <| |_| | |_) || |  
|_| \_\____/|_____|_| \_|  \_/    |_| \_\\___/|____/ |_|  
       
INSTALL 
rbenv + ruby-build + rbenv-sudo
${normal}"

# Get rbenv + plugins off github
sudo rm -r $GITREPOROOT1
git clone -b $BRANCH1 $GITREPO1 $GITREPOROOT1
git clone -b $BRANCH2 $GITREPO2 $GITREPOROOT2
git clone -b $BRANCH3 $GITREPO3 $GITREPOROOT3

# Set the envi vars
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
# Remove duplicate lines in case the script was run multiple times.
#awk '!NF || !seen[$0]++' /home/$USER/.bashrc > /home/$USER/.bashrc_new 
#mv /home/$USER/.bashrc_new /home/$USER/.bashrc
# Source & init
source ~/.bashrc
~/.rbenv/bin/rbenv init

# Let rbenv install the desired ruby version
cd $GITREPOROOT1
rbenv install $RUBYVERSION
rbenv rehash
sudo rbenv global $RUBYVERSION
rbenv local $RUBYVERSION

# Debug
rbenv -v && ruby -v && sudo ruby -v



