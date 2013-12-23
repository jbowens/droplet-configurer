#!/bin/bash

# Update aptitude
apt-get update

# Install some necessities
echo "Installing necessities"
apt-get install -y gcc make git mercurial htop postgresql nginx python python3

# Setup my vim preferences
echo "Setting up vim"
git clone https://github.com/jbowens/dotfiles.git
cp ./dotfiles/.vimrc ~/.vimrc
cp -r ./dotfiles/.vim ~/
rm -rf dotfiles

# Install go from source; Packages tend to be out of date
# and go development is still going very fast.
echo "Installing golang"
hg clone -u release https://code.google.com/p/go
cd go/src
./all.bash
