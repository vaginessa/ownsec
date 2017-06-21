#!/bin/bash


cd ~
#sudo rm -r .rbenv
#sed -i.bak -e '/export PATH="$HOME/.rbenv/bin:$PATH"/d' ~/.bashrc
#sed -i.bak '/eval "$(rbenv init -)"/d' ~/.bashrc 
#sed -i.bak '/export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"/d' ~/.bashrc 

git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo

source .bashrc
~/.rbenv/bin/rbenv init
RUBYVERSION=$(lynx --dump https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version )

rbenv install $RUBYVERSION
rbenv global $RUBYVERSION
rbenv local $RUBYVERSION
rbenv rehash
ruby -v

