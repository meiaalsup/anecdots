# Setting up PyEnv virtual environments for python
PATH=$(pyenv root)/shims:$PATH
export PATH

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
. ~/.pyenv/versions/3.7.3/bin/virtualenvwrapper.sh
