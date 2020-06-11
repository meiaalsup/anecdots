[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias vim='nvim'
alias sudo='sudo '

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# ls aliases
alias ll='ls -lsGahF ${colorflag}'
alias l='ls -lsGahF ${colorflag}'


alias jn='jupyter notebook'
alias pl='pdflatex'
alias julia="/Applications/Julia-1.2.app/Contents/Resources/julia/bin/julia"
alias vb='VBoxManage'

alias root='cd ~/../../'
alias dev='cd ~/dev/' 
alias dropbox='cd ~/Dropbox\ \(Personal\)/'
alias db='cd ~/Dropbox\ \(Personal\)/'
alias anecdots='cd ~/dev/anecdots/'
alias anecdotes='cd ~/dev/anecdots/'
alias dots='cd ~/dev/anecdots/'

alias mit='cd ~/dev/mit/'
alias sc='cd ~/dev/mit/classes/6.824/smart-cache/'
alias scg='cd ~/dev/smart-cache/smart-cache-go/'
alias scpp='cd ~/dev/smart-cache/smart-cache-cpp/'
alias re='cd ~/dev/research/'
alias mitei='cd ~/dev/research/mitei'
alias il='cd ~/dev/research/mitei/india-load'
alias merra='cd ~/dev/merra-2/'
alias merra2='cd ~/dev/merra-2/'
alias ids='cd ~/dev/mit/old/IDS.131/'
alias 824='cd ~/dev/mit/classes/6.824/'

alias garmin='cd /Volumes/GARMIN/Garmin'

# TODO: move these to ssh config
alias sshathena='ssh malsup@athena.dialup.mit.edu'
alias sshs='ssh malsup@txe1-login.mit.edu'


# TODO: move these to git specific alias config
alias gs='git status'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gca='git commit --amend'
alias punch='git push -f'
alias gp='git push'
alias ga='git add'
alias gd='git diff'
alias gf='git fetch'
alias gr='git rebase'
