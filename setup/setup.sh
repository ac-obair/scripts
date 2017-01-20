#!/bin/bash

# setup inital packages
brew install vim --with-python --with-ruby --with-perl
brew install python
brew install git
brew install expect

# set up fonts and base for terminal scheme
git clone https://github.com/powerline/fonts ~/Documents
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

mkdir ~/Devops

# setup iterm colours schemes
curl -o /tmp https:/github.com/mbadolato/iTerm2-Color-Schemes/tarball/master
tar xvf /tmp/mbadolato-iTerm2-Color-Schemes-2505e91.tar.gz -C /tmp
mv /tmp/mbadolato-iTerm2-Color-Schemes-2505e91/schemes ~/Documents/iterm-colours

# create passwordless sudo
echo 'lighiche ALL=(ALL:ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/lighiche

# setup keychain
curl -o /tmp http://www.funtoo.org/distfiles/keychain/keychain-2.8.2.tar.bz2
sudo tar -xvf /tmp/keychain-2.8.2.tar.bz2 -C /opt
echo "export PATH=$PATH:/opt/keychain" >> ~/.zshrc 
source ~/.zshrc

# install extra utils
brew install bash
brew install moreutils --without-parallel
brew install parallel
brew install grsync
brew install unzip
brew install homebrew/dupes/openssh
brew install homebrew/dupes/make
brew install homebrew/dupes/less 
brew install coreutils
brew install wget
brew install binutils
brew install homebrew/dupes/diffutils
brew install gawk
brew install gnutls
brew install gzip
brew install homebrew/dupes/grep --with-default-names
brew install screen
brew install watch
brew install findutils --with-default-names
brew install gnu-which --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names

# install vagrant
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
