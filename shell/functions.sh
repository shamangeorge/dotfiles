# Create a new directory and enter it
function mkd {
	mkdir -p "$@" && cd "$@"
}

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}
