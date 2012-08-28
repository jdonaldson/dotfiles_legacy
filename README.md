# Justin Donaldson Dot Files

These are config files to set up a system the way I like it. I've shamelessly
copied a lot of stuff from [Ryan Bates](https://github.com/ryanb/dotfiles).
But, I've changed a lot as well.  For one, I've disabled the zsh related
configs, and modified the vim configurations to work with vundle.  I've also
added a lot of misc utility vim plugins, they might be useful to others.

As Ryan notes, I am running on Mac OS X, but it will likely work on Linux as well.


## Installation

Run the following commands in your terminal. It will prompt you before it does
anything destructive. Check the Rakefile to see exactly what it is doing.

``terminal
git clone git://github.com/jdonaldson/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
``

After installing, open a new terminal window to see the effects.

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double
check the contents of the files before removing so you don't lose custom
settings.  It is helpful to also check the link targets in your home directory
``ls -l``.  If any of them are pointing to your ``.dotfiles`` directory, they
will need to be removed.

``terminal
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.gitconfig
rm -rf ~/.dotfiles
``

Then open a new terminal window to see the effects.
