task_fzf() {
    local selected_task
    local task_list=$(task --list | tail -n +2 | sed 's/\* //' | sed 's/  */ /g')

    selected_task=$(echo "$task_list" | awk -F ':' '{print $1}' | fzf --height 40% --preview "echo '$task_list' | grep '^{}:'" --preview-window=right:50%:wrap)

    if [[ -n "$selected_task" ]]; then
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
