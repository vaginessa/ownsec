#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  _____ _   ___     __  ____  _   _ ______   __
|  _ \| __ )| ____| \ | \ \   / / |  _ \| | | | __ ) \ / /
| |_) |  _ \|  _| |  \| |\ \ / /  | |_) | | | |  _ \\ V / 
|  _ <| |_) | |___| |\  | \ V /   |  _ <| |_| | |_) || |  
|_| \_\____/|_____|_| \_|  \_/    |_| \_\\___/|____/ |_|  
       
${normal}"


cd ~
#sudo rm -r .rbenv
#sed -i.bak -e '/export PATH="$HOME/.rbenv/bin:$PATH"/d' ~/.bashrc
#sed -i.bak '/eval "$(rbenv init -)"/d' ~/.bashrc 
#sed -i.bak '/export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"/d' ~/.bashrc 
sudo rm -r ~/.rbenv 
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo

source ~/.bashrc
~/.rbenv/bin/rbenv init
RUBYVERSION=$(lynx --dump https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version )
#exec -l $SHELL
cd ~
exec -l  rbenv install $RUBYVERSION
exec -l  rbenv rehash
sudo exec -l  rbenv global $RUBYVERSION
exec -l  rbenv local $RUBYVERSION
#exit 1


