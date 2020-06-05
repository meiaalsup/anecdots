# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."

# shortcuts
alias dropbox='cd ~/Dropbox\ \(Personal\)/'
alias dbox='cd ~/Dropbox\ \(Personal\)/'
alias db='cd ~/Dropbox\ \(Personal\)/'
alias jn='jupyter notebook'
alias pl='pdflatex'
alias vb='VBoxManage'
alias dev='cd ~/dev/' 
alias mit='cd ~/dev/mit/'
alias sc='cd ~/dev/mit/6.824/smart-cache/'
alias anecdotes='cd ~/dev/anecdotes/'
alias mitei='cd ~/dev/research/mitei'
alias il='cd ~/dev/research/mitei/india-load'
alias garmin='cd /Volumes/GARMIN/Garmin'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# ls aliases
alias ll='ls -lsGahF ${colorflag}'

# Protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Get updates for OS X, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g;'


# git aliases
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
