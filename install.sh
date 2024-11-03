# !/bin/zsh
# inspiration from many sources:
# * //github.com/jacobkahn/dotfiles
# * //github.com/holman/dotfiles
# * //github.com/driesvints/dotfiles
# * //github.com/anishathalye/dotfiles

# -e flag means process quits if there is a non-zero return status
set -e


# Configures color output for various messages
info () {
  printf '\r  [ \033[00;34m..\033[0m ] %s\n' "$1"
}

error () {
  printf '\r\033[2K  [ \033[0;93mER\033[0m ] %s\n' "$1"
  echo ''
}

success () {
    printf '\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n' "$1"
}
user () {
    printf '\r  [ \033[0;33m??\033[0m ] %s\n' "$1"
}

info "Configuring from scratch ..."

export DOTFILES="$HOME/anecdots"

# Argument parsing
MAC_SETUP=false;
LINUX_SETUP=false;
GIT_SETUP=false;

while [ "$#" -gt 0 ]; do
  case "$1" in
    # Install additional dependencies
    -m|--mac|--macsetup) MAC_SETUP=true; shift 1;;
    -l|--linux|--linuxsetup) LINUX_SETUP=true; shift 1;;
    -g|--git|--gitsetup) GIT_SETUP=true; shift 1;;
    -*) echo "unknown option: $1" >&2; exit 1;;
    *) echo "unknown option: $1" >&2; exit 1;;
  esac
done


setup_gitconfig () {
  if ! [ -f git/gitconfig.local.symlink ]
  then
    info 'setup gitconfig'

    # tells OS where the git config lives
    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    # prompts the user
    user ' - What is your github author name?'
    read -e -r git_authorname
    user ' - What is your github author email?'
    read -e -r git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.symlink.example > git/gitconfig.local.symlink

    git config --global pull.rebase true
    git config pager.diff false
    success 'gitconfig'
  else
    info 'git config already setup'
  fi

  if ! [ -d ${HOME}/references ]
  then
    info 'clone references repo'
    # clone other needed repos
    git clone https://github.com/meiaalsup/references.git "${HOME}/references" # useful stuff
    success 'cloned'
  else
    info 'references already cloned - skipping'
  fi
}

setup_linux() {
  echo "Installing packages for Linux"
  source "$DOTFILES/linux.sh"
}

setup_mac() {
    echo "Setting up Mac"

    # Install Homebrew if not present
    if test ! "$(which brew)"; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/meiaalsup/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Update Homebrew recipes
    brew update

    # Install all our dependencies with bundle (See Brewfile)
    brew tap homebrew/bundle
    brew bundle
    brew install fzf
    brew install npm
    brew install yarn
    npm install next@latest react@latest react-dom@latest
    npm install prisma @prisma/client


    # PRIVATEDIR="${HOME}/private"
    # git clone git@github.com:meiaalsup/private "$PRIVATEDIR" # private keys / authentication
    # # CREDENTIALS FROM PRIVATE REPO:
    # ln -s "${PRIVATEDIR}/pypirc" ~/.pypirc
}

link_file() {
  local src=$1 dst=$2

  local overwrite=
  local backup=
  local skip=
  local action=
  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
  then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then
      local currentSrc="$(readlink "$dst")"
      if [ "$currentSrc" == "$src" ]
      then
        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -r -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$src" "$dst"
    success "linked $src to $dst"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  # don't want all the mumbo jumbo from .git (version control files)
  for src in $(find -H "$DOTFILES" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    info "linking $src to $dst"
    link_file "$src" "$dst"
  done

  # initialize submodules in the dotfiles (vim)
  # https://git-scm.com/book/en/v2/Git-Tools-Submodules
  git submodule init
  git submodule update
}


vim_setup() {
  info 'setting up vim'

  mkdir -p "$HOME/.vim"
  ln -sfn "$DOTFILES/vim/pack" "$HOME/.vim/pack"

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


##### Configure Shell #####
info 'install zshell and make it the default shell'
zsh_install="$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ -d ~/.oh-my-zsh ]
then
    info "oh my zsh already installed - skipping"
else
    sh -c "$zsh_install"
    chsh -s /bin/zsh
fi


##### Git Config #####
# needs to be before dotfiles and file linking to link git config
if [ "$GIT_SETUP" == "true" ]
then
  setup_gitconfig
else
  info "skipping git config setup"
fi
unset GIT_SETUP

##### Set Up Dotfiles #####
info "setup dotfiles"
install_dotfiles
vim_setup


##### Linux Setup #####
if [ "$LINUX_SETUP" == "true" ]
then
  setup_linux
else
  info "skipping linux setup"
fi
unset LINUX_SETUP

##### MacOS Setup #####
if [ "$MAC_SETUP" == "true" ]
then
  setup_mac
else
  info "skipping mac setup"
fi
unset MAC_SETUP

info ''
info '  All installed!'
