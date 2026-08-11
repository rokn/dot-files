clear_and_context() {
    [[ -t 1 ]] && clear -x
	echo $(pwd) ":"
    ls
    if [ -d .git ]; then
        echo
        git st
    fi
}

# ZLE widget wrapper for clear_and_context
clear_and_context_widget() {
    clear_and_context
    # Add newline to separate output from prompt
    print ""
    print ""
    zle redisplay
}

# fcd: fuzzy cd into a directory
cdf() {
  local src dir
  if command -v fd >/dev/null 2>&1; then
    src="fd --type d --hidden --follow --exclude .git ''"
  else
    src="find . -type d -not -path '*/.git/*'"
  fi

  dir=$(eval "$src" | fzf --height 40% --reverse --prompt='cd> ') || return
  cd "$dir" || return
}
