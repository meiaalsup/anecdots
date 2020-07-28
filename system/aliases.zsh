# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."

alias anecdotes="cd $DOTFILES" # for typos sake
alias anecdots="cd $DOTFILES"
alias dots="cd $DOTFILES"
alias dotfiles="cd $DOTFILES"


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# ls aliases
alias l='ls -lsGahF ${colorflag}'
alias ll='ls -lsGahF ${colorflag}'

# Protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# print each PATH on separate line
alias path='echo -e ${PATH//:/\\n}'
