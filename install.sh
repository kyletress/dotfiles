# install Xcode tools if not already installed
if ! xcode-select -p > /dev/null 2>&1; then
  echo -e "Xcode command line tools are not installed"
  echo -e "a dialog will pop up to install"

  xcode-select --install
else
  echo -e "Xcode command line tools are already installed"
fi

# Variables

projects=~/projects
dir=~/dotfiles
olddir=~/dotfiles_old # the backups
files=".bash_profile aliases functions .gemrc .irbrc prompt .gitconfig .gitignore" # list of files to symlink

# create projects folder
echo "Creating a projects folder"
mkdir -p $projects
echo "...done"

# clone my website
echo "Setting up kyletress.com"
echo "Cloning the repo"
cd $projects
hub clone kyletress.com
echo "...done"

# create dotfiles_old in home directory
echo "Creating $olddir to backup old dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move existing dotfiles in home directory to dotfiles_old
# create the symlinks

for file in $files; do
  echo "Moving existing dotfiles from ~ to $olddir"
  mv ~/$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory"
  ln -s $dir/$file ~/.$file
done

# Install Homebrew
# ./brew.sh

# source ~/.bash_profile
