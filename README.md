# my dotfiles

This is my personal *very* opinionated setup. I use the `$HOME/.local` directory for any tools I run or try out and the `$HOME/.config` folder for configuring them (mostly). You can check out my path in the bash dotfiles folder. Don't hesitate to create an issue or merge request if you use this setup and like to make amendments.

# requirements

Create the `~/.local/bin` directory. Any tools/self compiled
executables I place here.

# some tools i use (and are needed for this)

```
sudo apt-get install silversearcher-ag
sudo apt install fzf
```


* [Direnv](https://direnv.net/docs/installation.html)
```
curl -sfL https://direnv.net/install.sh | bash
```

* [Pyenv](https://github.com/pyenv/pyenv)
```
curl https://pyenv.run | bash
```

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

### zsh (if you prefer)

```
  # get oh-my-zsh (change the default shell here or later manually your
  choice)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # get powerlevel10k and configure it to your liking
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  # finally install the custom .zshrc and env files
  ln -svif ~/.local/dotfiles/zsh.linux/zshrc.zsh ~/.zshrc
  ln -svif ~/.local/dotfiles/zsh.linux/zshenv.zsh ~/.zshenv
```

### vim
This config should work both for vim and neovim (I use neovim) and
update-alternatives to default to it
```
# setup vim
~/.local/dotfiles/vim/setup.sh
```

##### If you want to update all plugins in the `.janus` folder run the following

```
# reset all repos
find . -type d -mindepth 1 -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} reset --hard \;
# update the to master
find . -type d -mindepth 1 -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
```

### tmux

- Check out the [shamangeorge/.tmux](https://github.com/shamangeorge/.tmux) repository for my setup (based on the `gpakosz/.tmux` repository)

### gitconfig

```
  ln -svif ~/.local/dotfiles/generic/gitconfig ~/.gitconfig
```

Check out giconfig for values. Some things used are:

* [git-delta](https://github.com/dandavison/delta)

TODO: fallback to diff-so-fancy

gpg config for git
* use gpg2 by default
* sudo update-alternatives --config pinentry (make it so that it uses pinentry-curses and doesnt grab the diplay)

### if you are using rvm
```
  ln -svif ~/.local/dotfiles/generic/rvmrc ~/.rvmrc
```

### Install Cargo (rust)

Check
[here](https://doc.rust-lang.org/cargo/getting-started/installation.html)

#### Generic shell agnostic stuff to be used in both bash and zsh or any shell to setup (although its already setup in git as symlinks)

```
for file in $(\ls shell/*sh); do ln -srfv $file bash.linux/custom/$(echo $(basename $file) | sed -e 's/.sh/.bash/g'); done
for file in $(\ls shell/*sh); do ln -srfv $file bash.linux/custom/$(echo $(basename $file) | sed -e 's/.sh/.zsh/g'); done
```
