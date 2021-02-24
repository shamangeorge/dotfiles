#!/bin/bash

# Path to the central configuration
export MY_BASH="$HOME/.config/bash"

ln -svif $MY_BASH/bash_logout $HOME/.bash_logout
ln -svif $MY_BASH/bash_profile $HOME/.bash_profile
ln -svif $MY_BASH/bashrc $HOME/.bashrc
ln -svif $MY_BASH/profile $HOME/.profile
ln -svif $MY_BASH/inputrc $HOME/.inputrc
