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

# Install ruby-build

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install Chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Link dotfiles

ln -sf ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.pryrc ~/.pryrc
