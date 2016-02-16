My dotfiles. A work-in-progress as I learn.

## How to install

Install the Xcode tools

```shell
$ xcode-select --install
```

Clone into a directory

```shell
$ git clone https://github.com/kyletress/dotfiles
```

WIP: `install.sh` for symlinking and installing everything.

## The Install script

The first thing to do is run `.install.sh`. This file begins by checking for the Xcode command line tools. If they aren't installed, it will prompt you to install them.

Next, the script will set up your `.gitconfig` file. If it doesn't exist, the command line will prompt you for your Github author name and email, then symlink the example file to `gitconfig.local.symlink`.

The script will then symlink anything with a `.symlink` extension. This is still a work in progress. 
