# pkill
function pkill() {
    ps aux | \
        fzf --height 40% --layout=reverse --prompt="Select process to kill:" --preview="" | \
        awk '{print $2}' | \
        xargs -r sudo kill
}

# Vipe (Vim pipe editor)
function vipe() {
   local file=$(mktemp)
   nvim -c "w! $file" - > /dev/tty
   cat $file
   rm $file
}

# PET
function pet-register-prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^p' pet-select

# YAZI
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# git fetch
gitf() {
    git fetch --all --prune

    if command -v onefetch > /dev/null; then
        onefetch
    else
        echo "onefetch is not installed"
    fi

    echo "    ${CYAN}-------------------GIT LOG--------------------${NC}"
    git lg -10

    echo
    echo "    ${CYAN}-----------------GIT STATUS-------------------${NC}"
    git s

    local stash_list
    stash_list=$(git stash list)
    if [ -n "$stash_list" ]; then
        echo
        echo "    ${CYAN}-----------------GIT STASH-------------------${NC}"
        echo "$stash_list"
    fi
}

# project
p() {
    local CYAN='\033[0;36m'
    local NC='\033[0m' # No Color

    local folders=(
        "$HOME/dev/mossos/microservices"
        "$HOME/dev/microservices"
        "$HOME/Dev/mossos/microservices"
        "$HOME/Dev/microservices"
        "$HOME/dev"
        "$HOME/Dev"
        "$HOME"
    )

    for folder in "${folders[@]}"; do
        if [ -d "$folder" ]; then
            # Change to the directory and exit the loop if successful
            cd "$folder" || { echo "Failed to change directory to $folder"; return 1; }
            echo "Changed directory to $folder"
            break
        fi
    done

    local git_dirs=()

    # Use fd to search for directories and check if they contain a .git subdirectory
    while IFS= read -r dir; do
        if [ -d "$dir/.git" ]; then
            # Add the directory to the array
            git_dirs+=("$dir")
        fi
    done < <(fd -t d .)

    # Use fzf to let the user choose a directory from the list
    local selected_dir
    selected_dir=$(printf "%s\n" "${git_dirs[@]}" | fzf --prompt="Select a Git repository directory: " --preview="onefetch {} && tree -l 3 -c always {}")

    if [ -n "$selected_dir" ]; then
        cd "$selected_dir" || { echo "Failed to change directory to $selected_dir"; return 1; }
        echo "Changed directory to $selected_dir"
        gitf
    else
        echo "No directory selected"
    fi
}

# tmux new
tmn() {
    local session_name="$1"
    
    if [ -z "$session_name" ]; then
        echo -n "Session name? (default: default)  > " 
        read session_name
        session_name=${session_name:-default}
    fi
    
    tmux new -s "$session_name"
}


t() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c -z | fzf --height 80% --reverse --border-label ' sesh ' --border --prompt '⚡  ' --preview 'sesh preview {}')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}
