# extras

# This loads NVM if it exists
# Don't forget to alias your default version
if [ -d "$HOME/.nvm/" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm alias default stable
  nvm use stable
fi

# Load Yarn Version Manager
export YVM_DIR=/home/pikos/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# This loads RVM if it exists
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && rvm use 3.0.0

# This loads sdk man if it exists
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# This loads cargo for rust packages
[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Setup some go configuration if you want to
export GOROOT=$HOME/.local/src/go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
# tgenv
export PATH="$HOME/.tgenv/bin:$PATH"

export GPG_TTY=$TTY
