sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties nodejs postgresql postgresql-contrib libpq-dev

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.1.3
rbenv global 2.1.3

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

yes | gem install rdoc
yes | gem install bundler
yes | gem install rake 
rbenv rehash
yes | gem install rails
rbenv rehash

echo "Cleaning up"
sudo apt-get clean

git config --global user.email $1
git config --global user.name $2

cd /vagrant
rails new blog

cd blog

rails server -b 0.0.0.0