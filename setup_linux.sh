#!/bin/bash

packages=(
  build-essential
  curl
  git
  htop
  rbenv
  redis
  xclip
  zsh
)

for pkg in "${packages[@]}"
do
  sudo apt install "${pkg}"
done

cd ~

# Install ruby-build

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install nvm

curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh

bash install_nvm.sh

# Install Chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Link dotfiles

ln -sf ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.pryrc ~/.pryrc
