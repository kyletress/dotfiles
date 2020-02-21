#!/usr/bin/env zsh

files="gemrc gitconfig gitignore irbrc railsrc vimrc zprofile zshrc"
backup_directory=~/dotfiles_backup

echo "Creating $backup_directory directory for existing dotfiles"
mkdir -p $backup_directory 

for file in .gemrc .gitconfig .gitignore .irbrc .railsrc .vimrc .zprofile .zshrc
do
  echo "Processing $file"
  if [ -f "$HOME/$file" -o -d "$HOME/$file" -o -L "$HOME/$file" ] 
  then
    echo "$file exists\n\
    [s]kip, [o]verwrite, [b]ackup?"
    read -n 1 

    case $1 in
      o)
        rm "$HOME/$file"
        ln -s "$HOME/dotfiles/$file" "$HOME/$file"
        echo $file overwritten
        ;;
      b) 
        mv "$HOME/$file" "$backup_directory"
        ln -s "$HOME/dotfiles/$file" "$HOME/$file" 
        echo $file backed up
        ;;
      s) 
        echo $file skipped
        ;;
      *)
        ;;
    esac
  else
    ln -s "$HOME/dotfiles/$file" "$HOME/$file"
    echo "$file has been linked"
  fi
done

# Homebrew 

if test ! $(which brew); then 
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
  echo "Homebrew already installed. Moving on..."
fi

brew update
brew tap homebrew/bundle
brew bundle

echo "Done."
