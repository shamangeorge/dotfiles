#/bin/bash

export DOTFILES="$HOME/.local/dotfiles"
export VIM_CONFIG="$DOTFILES/vim"
export JANUS_REPO="$VIM_CONFIG/.config/nvim"
export JANUS_VIMRC="$JANUS_REPO/janus/vim/vimrc"
export NEOVIM_CONFIG="$HOME/.config/nvim"
export HOME_VIM_CONFIG="$HOME/.vim"
export VIM_PLUGINS="$VIM_CONFIG/.janus"
export INIT_VIM="$JANUS_REPO/init.vim"
export VIMRC="$HOME/.vimrc"
export VIM_PACKAGES="$HOME/.janus"
export VIMRC_BEFORE="$HOME/.vimrc.before"
export VIMRC_AFTER="$HOME/.vimrc.after"

git clone git@github.com:carlhuda/janus.git $JANUS_REPO
cd $JANUS_REPO
rake
mkdir $VIM_PLUGINS
ln -svif $JANUS_VIMRC $VIMRC
ln -svif $VIMRC $INIT_VIM
ln -svif $VIM_CONFIG/.vimrc.before $VIMRC_BEFORE
ln -svif $VIM_CONFIG/.vimrc.after $VIMRC_AFTER
ln -svif $VIM_PLUGINS $VIM_PACKAGES
ln -svif $JANUS_REPO $NEOVIM_CONFIG
ln -svif $JANUS_REPO $HOME_VIM_CONFIG
cd $VIM_PLUGINS

git clone git@github.com:rking/ag.vim.git
git clone git@github.com:Shougo/deoplete.nvim.git
git clone git@github.com:mattn/emmet-vim.git
git clone git@github.com:robbles/logstash.vim.git
git clone git@github.com:gregsexton/MatchTag.git
git clone git@github.com:chr4/nginx.vim.git
git clone git@github.com:vim-scripts/Rename2.git
git clone git@github.com:godlygeek/tabular.git
git clone git@github.com:tpope/vim-abolish.git
git clone git@github.com:jreybert/vimagit.git
git clone git@github.com:vim-airline/vim-airline.git
git clone git@github.com:ryanoasis/vim-devicons.git
git clone git@github.com:ktonga/vim-follow-my-lead.git
git clone git@github.com:vitapluvia/vim-gurl.git
git clone git@github.com:nathanaelkane/vim-indent-guides.git
git clone git@github.com:xolox/vim-misc.git
git clone git@github.com:xolox/vim-notes.git
git clone git@github.com:jceb/vim-orgmode.git
git clone git@github.com:diepm/vim-rest-console.git
git clone git@github.com:mhinz/vim-startify.git
git clone git@github.com:wakatime/vim-wakatime.git
git clone git@github.com:lambdalisue/glyph-palette.vim
git clone git@github.com:pangloss/vim-javascript.git
git clone git@github.com:leafgarland/typescript-vim.git
git clone git@github.com:MaxMEllon/vim-jsx-pretty.git
git clone git@github.com:peitalin/vim-jsx-typescript.git
git clone git@github.com:styled-components/vim-styled-components.git
git clone git@github.com:jparise/vim-graphql.git
