#!/bin/bash

# Update aptitude
apt-get update

# Install some necessities
echo "Installing necessities"
apt-get install -y gcc make git mercurial htop postgresql nginx python python3 golang-go

# Setup my vim preferences
echo "Setting up vim"
git clone https://github.com/jbowens/dotfiles.git
cp ./dotfiles/.vimrc ~/.vimrc
cp -r ./dotfiles/.vim ~/
rm -rf dotfiles

# Set the default shell
sed 's/sh/bash/g' /etc/default/useradd > /etc/default/useradd

# Set GOROOT globally
echo 'export GOROOT=/usr/lib/go' >> /etc/bash.bashrc

# Setup a user under which everything will run
echo "Creating production user"
useradd prod
mkdir /home/prod
chown prod:prod /home/prod

su prod
cd /home/prod
mkdir go
echo "export GOPATH=$GOPATH:/home/prod/go" >> ~/.bashrc
. ~/.bashrc
cd go
go get github.com/robfig/revel/revel
exit
