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

##### If you want to update all plugins in the `.janus` folder run the following

```
# reset all repos
find . -type d -mindepth 1 -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} reset --hard \;
# update the to master
find . -type d -mindepth 1 -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
```

### tmux

- Check out the [shamangeorge/.tmux](https://github.com/shamangeorge/.tmux) repository for my setup (based on the `gpakosz/.tmux` repository)

### git

Check out giconfig for values. Some things used are:

delta, TODO: link here
TODO: fallback to diff-so-fancy
gpg config for git
* use gpg2 by default
* sudo update-alternatives --config pinentry (make it so that it uses
  pinentry-curses and doesnt grab the diplay)


#### Generic shell agnostic stuff to be used in both bash and zsh or any shell to setup (although its already setup in git as symlinks)

```
for file in $(\ls shell/*sh); do ln -srfv $file bash.linux/custom/$(echo $(basename $file) | sed -e 's/.sh/.bash/g'); done
for file in $(\ls shell/*sh); do ln -srfv $file bash.linux/custom/$(echo $(basename $file) | sed -e 's/.sh/.zsh/g'); done
```
