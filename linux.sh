#!/bin/zsh

sudo apt install htop
sudo apt install tmux
sudo apt install wget
sudo apt install fzf
sudo apt install wdiff
sudo apt install zsh-autosuggestions
sudo apt install shellcheck

# install tldr
mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr
