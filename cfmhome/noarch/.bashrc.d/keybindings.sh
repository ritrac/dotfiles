__append_project() {
    READLINE_LINE="${READLINE_LINE}$(find $HOME/nfsHome/projets/ $HOME/projets/ -mindepth 1 -maxdepth 1 | fzf --scheme=path) "
    READLINE_POINT=$(echo "$READLINE_LINE" | wc -c)
}
bind -x '"\C-f": "__append_project"'
bind -x '"\C-bf": "tmux-sessionizer"'

# Shift TAB
__fzf_complete_recursive() {
    if [ -n "$1" ]; then
        depth=$1
    else
        depth=1
    fi

    local file="$(find -L $2 -mindepth 1 -maxdepth $depth | fzf --scheme=path)"

    if [ -z "$file" ]; then
        echo $2
        return
    fi

    if [ -d "$file" -o -L "$file" ]; then
        depth="$(( x + 1 ))"
        file="$(__fzf_complete_recursive $depth "$file/")"
    else
        file="${file} "
    fi
    echo "$file"
}
__fzf_complete() {
    file="$(__fzf_complete_recursive 1)"
    READLINE_LINE="${READLINE_LINE}${file}"
    READLINE_POINT=$(echo "$READLINE_LINE"| wc -c)
}
bind -x '"\e[Z": "__fzf_complete"'
