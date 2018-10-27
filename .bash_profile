source $HOME/.portablerc
export PATH=$PATH:$HOME/bin
if [ -s ~/.bashrc ]; then source ~/.bashrc; fi

export GITHUB_ACCESS_TOKEN='19f5fdd43db1ca10a6de210592ff0b6bef4af301'
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export GITHUB_USERNAME='meiaalsup'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
