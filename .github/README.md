# My dotfiles

These are some of my common dotfiles for zsh, vim, git, etc.

It works by simply using a git repository, taking advantage that a .git
directory and it's checkout don't need to be in the same place.

## Install

Create an alias to run commands

`alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

Ignore the dotfiles repository itself, otherwise there will be weird
recursion issues
echo ".dotfiles" >> .gitignore


Clone the repo 
`git clone --bare <git-repo-url> $HOME/.dotfiles`

Define the alias above in the current shell

Check it out `config checkout`

Install oh my zsh 

Run `vundle`

## Afters
Read through the dotfiles and adjust as necessary, otherwise you'll be committing
things as dsas and so on.

## Thanks

- [Zach Holman](http://github.com/holman/)
- [Matt Smith](http://github.com/qbyt)

