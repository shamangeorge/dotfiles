#/bin/bash

export DOTFILES="$HOME/.local/dotfiles"

export VIM_CONFIG="$DOTFILES/vim"
export JANUS_REPO="$VIM_CONFIG/janus"
export JANUS_VIMRC="$JANUS_REPO/janus/vim/vimrc"

export NEOVIM_CONFIG="$HOME/.config/nvim"
export HOME_VIM_CONFIG="$HOME/.vim"

export VIM_PLUGINS="$VIM_CONFIG/.janus"
export INIT_VIM="$JANUS_REPO/init.vim"
export VIMRC="$HOME/.vimrc"
export VIMRC_BEFORE="$HOME/.vimrc.before"
export VIMRC_AFTER="$HOME/.vimrc.after"

git clone git@github.com:carlhuda/janus.git $JANUS_REPO
cd $JANUS_REPO

rake
ln -svif $JANUS_VIMRC $VIMRC
ln -svif $JANUS_VIMRC $INIT_VIM
ln -svif $VIM_CONFIG/vimrc.before $VIMRC_BEFORE
ln -svif $VIM_CONFIG/vimrc.after $VIMRC_AFTER
ln -svif $VIM_PLUGINS $HOME/.janus
ln -svif $JANUS_REPO $NEOVIM_CONFIG
cd $VIM_PLUGINS

git clone git@github.com:rking/ag.vim.git
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
git clone git@github.com:kyazdani42/nvim-web-devicons.git
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
git clone git@github.com:peitalin/vim-jsx-typescript
git clone git@github.com:voldikss/vim-floaterm.git
git clone git@github.com:mhinz/vim-signify.git
git clone git@github.com:nvim-treesitter/nvim-treesitter.git
git clone git@github.com:nvim-lua/plenary.nvim
git clone git@github.com:nvim-telescope/telescope.nvim.git
git clone git@github.com:glepnir/dashboard-nvim.git
#git clone git@github.com:bagrat/vim-buffet.git # buffer based not yet productive
git clone github.com:mg979/vim-visual-multi.git
#git clone git@github.com:lewis6991/gitsigns.nvim.git # can be used instead of signify
git clone git@github.com:folke/trouble.nvim.git # not yet configured properly
#git clone git@github.com:neoclide/coc.nvim.git
git clone git@github.com:Shougo/deoplete.nvim.git
git clone git@github.com:folke/lsp-colors.nvim.git
#git clone git@github.com:folke/todo-comments.nvim.git
git clone git@github.com:dense-analysis/ale.git # background functions for linting
git@github.com:lambdalisue/vim-manpager.git # use vim as the manpager
git clone https://github.com/jvirtanen/vim-hcl.git # hashicorp config language syntax
git clone https://github.com/shaunsingh/nord.nvim.git # nord color scheme
git clone git@github.com:morhetz/gruvbox.git # gruvbox (my theme of choice)
git clone git@github.com:wuelnerdotexe/vim-enfocado.git # another cool color theme
