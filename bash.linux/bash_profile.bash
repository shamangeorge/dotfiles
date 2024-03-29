# Refresh/Clean the environment
if [ -f /etc/environment ]; then
  . /etc/environment
fi
# Load all the system bash_completions
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Path to the central configuration
export MY_BASH="$HOME/.local/dotfiles/bash.linux"

# Load the shell dotfiles, and then some:
for file in $MY_BASH/custom/{path,exports,extra,aliases,functions}.bash; do
	[ -r "$file" ] && . "$file"
done
unset file


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Append to the Bash history file, rather than overwriting it
shopt -s histappend
# https://unix.stackexchange.com/questions/4079/put-history-command-onto-command-line-without-executing-it
# Verify instead of running the command
# this will insert the command into shell instead of executing it
shopt -s histverify

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# add it to both commands and aliases, i.e ssh, and the copy alias (defined in aliases)
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh copy open_sesame

# get some git prompt functions
[[ -s "$MY_BASH/git-prompt.sh" ]] && source $MY_BASH/git-prompt.sh

prompt_hostname ()
{
  PHOST="\[\033[1;31m\]\u@\h: \[\033[32m\]\w"
  echo -e "\033[0;35m${PHOST}\033[0m"
}
prompt_python_virtualenv () {
  # get the python env info
  if command -v python >/dev/null 2>&1; then
    # check if we have python
    python_version=`python -c "import sys; print('.'.join(map(str, sys.version_info[:])))"`
    if [ -z ${VIRTUAL_ENV+x} ]; then
      # check for virtualenv
      python_trail="";
    else
      python_trail=":`basename \"$VIRTUAL_ENV\"`";
    fi
    echo "python-$python_version$python_trail"
  fi
}
prompt_node () {
  # get the node env info
  if command -v node >/dev/null 2>&1; then
    # check if we have node (from nvm)
    echo "node-$(node -v),"
  elif command -v nodejs >/dev/null 2>&1; then
    # check if we have node (from the system)
    echo "node-$(nodejs -v),"
  fi
}
prompt_ruby () {
  # get the ruby env info
  if command -v rvm >/dev/null 2>&1; then
    # check if we have rvm
    rbv=`rvm-prompt`;
    rbv=${rbv#ruby-};
    [[ $rbv == *"@"* ]] || rbv="${rbv}@default";
    echo "ruby-"$rbv","
  elif command -v ruby >/dev/null 2>&1; then
    # check if we have only ruby
    vrs=`ruby -e "puts 'ruby-'+RUBY_VERSION"`
    echo "$vrs,"
  fi
}
prompt_right ()
{
  echo -e "\033[0;36m$(echo $(prompt_ruby) $(prompt_node) $(prompt_python_virtualenv))\033[0m"
}

prompt_git () {
  command -v git >/dev/null 2>&1 && echo $(__posh_git_echo)
}
prompt_now () {
  NOW="\[\033[35m\]\$(date)"
  echo -e "\033[0;35m${NOW}\033[0m"
}
prompt_return_mood () {
  # prints a happy or sad face based on the previous function status
  MOOD_FACE="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` ->"
  echo -e "\033[0;35m${MOOD_FACE}\033[0m"
}
prompt_tty_info () {
  PTTYINFO="\[\e[1;33m\]hist:\!, jobs:\j, \[\033[1;34m\]\$(tty | sed -e 's:/dev/::')"
  echo -e "\033[0;35m${PTTYINFO}\033[0m"
}
directory_info () {
  DIRINFO="\[\033[1;36m\]\$(ls -1 | wc -l | sed 's: ::g') files \[\033[1;33m\]\$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"
  echo -e "\033[0;35m${DIRINFO}\033[0m"
}
prompt_developer_full ()
{
  compensate=11;
  PS1=$(printf "%*s\r%s\n%s %s, %s\n%s %s\n\$ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_now)" "$(prompt_return_mood)" "$(prompt_tty_info)" "$(directory_info)" "$(prompt_hostname)" "$(prompt_git)")
}
prompt_developer ()
{
  compensate=11;
  PS1=$(printf "%*s\r%s %s \n\$ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_hostname)" "$(prompt_git)")
}
prompt ()
{
  prompt_developer;
}

# Drag the history along in all sessions
export PROMPT_COMMAND="history -a; history -c; history -r; prompt;"


# Direnv setup
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"
# Fuzzy finder installation
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export GPG_TTY=$(tty)
