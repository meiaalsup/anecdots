#!/bin/bash

BASEDIR="/Users/meiaalsup/dev/anecdots"
PRIVATEDIR="/Users/meiaalsup/dev/private"
# bash
ln -s $BASEDIR/bash_profile ~/.bash_profile
ln -s $BASEDIR/bashrc ~/.bashrc

# tmux
ln -s $BASEDIR/tmux.conf ~/.tmux.conf


# vim
#ln -s ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
#ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
#ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# CREDENTIALS FROM PRIVATE REPO:
ln -s $PRIVATEDIR/pypirc ~/.pypirc



