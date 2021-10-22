# my dotfiles

This is my personal *very* opinionated setup. I use the `$HOME/.local` directory for any tools I run or try out and the `$HOME/.config` folder for configuring them (mostly). You can check out my path in the bash dotfiles folder. Don't hesitate to create an issue or merge request if you use this setup and like to make amendments.

## setup
```
git clone git@github.com:shamangeorge/dotfiles ~/.local/dotfiles
```

### bash
```
ln -svif ~/.local/dotfiles/bash.linux ~/.config/bash
# now setup everything
~/.config/bash/setup.sh
```

### vim
```
# setup vim
~/.local/dotfiles/vim/setup.sh
```

### tmux

- Check out the [shamangeorge/.tmux](https://github.com/shamangeorge/.tmux) repository for my setup (based on the `gpakosz/.tmux` repository)
