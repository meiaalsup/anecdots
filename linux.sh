#!/bin/zsh

sudo yum install htop
sudo yum install tmux
sudo yum install wget

#sudo yum install wdiff
#sudo yum install zsh-autosuggestions
#sudo yum install shellcheck

# install fzf

if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    else
        echo "fzf is already installed"
fi

#sudo yum install -y ShellCheck
