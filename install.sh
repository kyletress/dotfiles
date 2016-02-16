#!/usr/bin/env bash

# first problem is here....
# cd "$(dirname "$0")/.."
DOTFILES_ROOT=~/dotfiles

# exit if any line fails
set -e
echo ''

# install Xcode tools if not already installed
echo "Installing Xcode command line tools..."
if ! xcode-select -p > /dev/null 2>&1; then
  echo -e "a dialog will pop up to install"

  xcode-select --install
else
  echo -e "Already installed."
fi

# Set up gitconfig file with correct user information
setup_gitconfig () {
  if ! [ -f git/gitconfig.local.symlink ]
  then
    echo 'Setting up your gitconfig...'
    git_credential='osxkeychain'
    echo ' - What is your GitHub name?'
    read -e git_authorname
    echo ' - What is your GitHub email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.symlink.example > git/gitconfig.local.symlink

    echo 'successfully created your .gitconfig'
  fi
}

# Function to handle the symbolic linking
link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  # true if file, directory, or symbolic link
  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        echo -e "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

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
      echo "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      echo "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      echo "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    echo "linked $1 to $2"
  fi
}

install_dotfiles () {
  echo 'installing dotfiles...'

  local overwrite_all=false backup_all=false skip_all=false

  # find the files with the .symlink extension, only going 2 levels deep.
  # and ignoring the .git directory
  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    # destination file should strip .symlink extension and add a '.'
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

setup_gitconfig
install_dotfiles

# install homebrew
# setup project folder
# clone some repos

# # Variables
#
# projects=~/projects
# # create projects folder
# echo "Creating a projects folder..."
# mkdir -p $projects
# echo "...done"
#
# # clone my website
# echo "Setting up kyletress.com..."
# echo "Cloning the repo..."
# cd $projects
# hub clone kyletress.com
# echo "...done"
#
