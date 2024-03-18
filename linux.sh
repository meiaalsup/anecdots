#!/bin/zsh

sudo yum install htop
sudo yum install tmux
sudo yum install wget
#sudo yum install fzf

#sudo yum install wdiff
#sudo yum install zsh-autosuggestions
#sudo yum install shellcheck

# install fzf
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# install tldr
mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr
