#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core

# install heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
# For more heroku fix, do
# $ heroku login
#$ ssh-keygen -t rsa
#$ heroku keys:add

# And in repo: heroku create; git push heroku master

curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
#sudo apt-add-repository -y ppa:cassou/emacs
#sudo apt-get update
#sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

#Install tmux
sudo apt-get install -y tmux
# Install vim
sudo apt-get install -y vim

# pull down my dotvim, and link
git clone https://github.com/uvesten/dotvim .vim
cd .vim
git submodule init
git submodule update
cd ..
ln -sb .vim/.vimrc
ln -sb .vim/.screenrc

# git pull and install dotfiles as well
# Defaults are fine for me atm. 
#cd $HOME
#if [ -d ./dotfiles/ ]; then
    #mv dotfiles dotfiles.old
#fi
#if [ -d .emacs.d/ ]; then
    #mv .emacs.d .emacs.d~
#fi
#git clone https://github.com/startup-class/dotfiles.git
#ln -sb dotfiles/.screenrc .
#ln -sb dotfiles/.bash_profile .
#ln -sb dotfiles/.bashrc .
#ln -sb dotfiles/.bashrc_custom .
#ln -sf dotfiles/.emacs.d .

