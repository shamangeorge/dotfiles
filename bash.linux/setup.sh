#!/bin/bash

##################
# Setup for linux
##################

# Bash

# Path to the central configuration
export MY_BASH="$HOME/.local/dotfiles/bash.linux"

ln -svif $MY_BASH/bash_logout.bash $HOME/.bash_logout
ln -svif $MY_BASH/bash_profile.bash $HOME/.bash_profile
ln -svif $MY_BASH/bashrc $HOME/.bashrc
ln -svif $MY_BASH/profile.bash $HOME/.profile
ln -svif $MY_BASH/inputrc $HOME/.inputrc

# Zsh setup
# This is a little more involved as it uses oh-my-zsh with powerlevel10k

# So install oh-my-zsh and powerlevel10k
# and then setup
# TODO: needs to be automated
