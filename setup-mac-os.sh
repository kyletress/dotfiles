#!/usr/bin/env bash

main() {
  # ask for sudo credentials
  ask_for_sudo
  # install homebrew
  install_homebrew
  # clone dotfiles repo for install_packages_with_brewfile to have access to Brewfile
  clone_dotfiles
  # install packages_with_brewfile 
  install_packages_with_brewfile
  # # change default shell to fish 
  # change_shell_to_fish
  # # install pip packages
  # install_pip_packages
  # # install yarn packages
  # install_yarn_packages
  # # setup symlinks so setup_vim can install all plugins
  # setup_symlinks
  # # setup vim
  # setup_vim
  # # setup_tmux
  # setup_tmux
  # # updates hosts file
  # update_hosts_file
  # # setup macOS defaults
  # setup_macOS_defaults
  # # update login items
  # update_login_items
}

DOTFILES_REPO=~/dotfiles

function ask_for_sudo() {
    info "Prompting for sudo password"
    if sudo --validate; then
        # Keep-alive
        while true; do sudo --non-interactive true; \
            sleep 10; kill -0 "$$" || exit; done 2>/dev/null &
        success "Sudo password updated"
    else
        error "Sudo password update failed"
        exit 1
    fi
}


function install_homebrew() {
  info "Installing Homebrew"
  if hash brew 2>/dev/null; then
    success "Homebrew already installed"
  else
    url=https://raw.githubusercontent.com/Homebrew/install/master/install
    if /usr/bin/ruby -e "$(curl -fsSL ${url})"; then
      success "Homebrew successfully installed"
    else
      error "Homebrew installation failed"
      exit 1
    fi
  fi
}

function clone_dotfiles() {
  info "cloning dotfiles into ${DOTFILES_REPO}"
  if test -e $DOTFILES_REPO; then 
    subset "${DOTFILES_REPO} already exists"
    pull_latest $DOTFILES_REPO
  else
    url=https://github.com/kyletress/dotfiles.git
    if git clone "$url" $DOTFILES_REPO && \
      git -C $DOTFILES_REPO remote set-url origin git@github.com:kyletress/dotfiles.git; then 
        success "Dotfiles repository cloned into ${DOTFILES_REPO}"
    else
      error "Failed to clone dotfiles repository"
      exit 1
    fi
  fi
}

function pull_latest() {
  substep "Pulling latest changes in ${1} repository"
  if git -C $1 pull origin master $> /dev/null; then
    return 
  else 
    error "Please pull latest changes in ${1} repository manually"
  fi
}

function install_packages_with_brewfile() {
  BREW_FILE_PATH="${DOTFILES_REPO}/Brewfile"
  info "Installing packages in ${BREW_FILE_PATH}"
  if brew bundle check --file="$BREW_FILE_PATH" &> /dev/null; then
    success "Brewfile dependencies are already satisfied"
  else
    if brew bundle --file="$BREW_FILE_PATH"; then
      success "Brewfile successfully installed"
    else
      error "Brewfile installation failed"
      exit 1
    fi
  fi
}

function coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

function info() {
    coloredEcho "$1" blue "========>"
}

function substep() {
    coloredEcho "$1" magenta "===="
}

function success() {
    coloredEcho "$1" green "========>"
}

function error() {
    coloredEcho "$1" red "========>"
}

main "$@"
