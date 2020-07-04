source $HOME/.portablerc
export PATH=$PATH:$HOME/bin
if [ -s ~/.bashrc ]; then source ~/.bashrc; fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH=$PATH:$HOME/.local/bin

export GITHUB_USERNAME='meiaalsup'

export BASH_SILENCE_DEPRECATION_WARNING=1

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Setting up PyEnv virtual environments for python
PATH=$(pyenv root)/shims:$PATH
export PATH

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
. ~/.pyenv/versions/3.7.3/bin/virtualenvwrapper.sh

PATH="/Applications/Julia-1.2.app/Contents/Resources/julia/bin:${PATH}"

# make python multiprocessing Pool work: https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

source /Users/meiaalsup/.config/broot/launcher/bash/br
