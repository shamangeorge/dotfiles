#!/bin/bash

##################
# Setup for linux
##################

# Zsh setup
# This is a little more involved as it uses oh-my-zsh with powerlevel10k
# So install oh-my-zsh and powerlevel10k
# and then setup
# TODO: needs to be automated

# Path to the central configuration
export MY_ZSH="$HOME/.local/dotfiles/zsh.linux"

ln -svif $MY_ZSH/zshrc.zsh $HOME/.zshrc
ln -svif $MY_ZSH/zlogin.zsh $HOME/.zlogin
ln -svif $MY_ZSH/zshenv.zsh $HOME/.zshenv
ln -svif $MY_ZSH/p10k.zsh $HOME/.p10k.zsh
