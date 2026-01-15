task_fzf() {
    local selected_task
    local task_list=$(task --list | tail -n +2 | sed 's/\* //' | sed 's/  */ /g')

    selected_task=$(echo "$task_list" | awk '{print $1}' | sed 's/:$//' | fzf --height 40% --preview "task --summary {}" --preview-window=right:50%:wrap)

    if [[ -n "$selected_task" ]]; then
        print -s "task $selected_task"
        task "$selected_task"
    fi
}

clear_and_context() {
    [[ -t 1 ]] && clear -x
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
