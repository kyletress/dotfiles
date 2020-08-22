## Installation 

Clone the dotfiles repo and make the `install.sh` script executable. 
```
cd ~/dotfiles
chmod +x install.sh
./install.sh
```
or maybe you can do this:

```
curl --silent https://raw.githubusercontent.com/kyletress/dotfiles/master/install.sh | zsh
```

## Vim Package Manager 

### Adding a package

Use git submodules: 

```
git submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/bundle/start/vim-airline
```
### Removing a package

```
git submodule deinit .vim/pack/bundle/start/vim-airline
git rm .vim/pack/bundle/start/vim-airline
rm -Rf .git/modules/.vim/pack/bundle/start/vim-airline
```
