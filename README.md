# Justin Donaldson's Dot Files

These are config files to set up a system the way I like it. I've shamelessly
copied a lot of stuff from [Ryan Bates](https://github.com/ryanb/dotfiles).
But, I've changed a lot as well.  For one, I've disabled the zsh related
configs, and modified the vim configurations to work with vim-plug.  I've also
added a lot of misc utility vim plugins, they might be useful to others.

I use this set of configs for both my osx and linux machines.

## Installation

Run the following commands in your terminal. It will prompt you before it does
anything destructive. Check the Rakefile to see exactly what it is doing.

```bash
git clone git://github.com/jdonaldson/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double
check the contents of the files before removing so you don't lose custom
settings.  It is helpful to also check the link targets in your home directory
``ls -l``.  If any of them are pointing to your ``.dotfiles`` directory, they
will need to be removed.

```bash
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.gitconfig
rm -rf ~/.dotfiles
```
