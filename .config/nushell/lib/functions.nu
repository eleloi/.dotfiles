def pkill [] {
    ps | sort-by cpu --reverse | sk --format {get name} --preview {} | kill $in.pid
}

def pet-register-prev [] {
    let last = history | last
    pet new ($last.command)
}

def gitf [] {
    git fetch --all --prune

    if (which onefetch | is-not-emtpy) {
        onefetch
    } else {
        echo "onefetch is not installed"
    }

    echo "    ${CYAN}-------------------GIT LOG--------------------${NC}"
    git lg -10

    echo
    echo "    ${CYAN}-----------------GIT STATUS-------------------${NC}"
    git s

    let stash_list = git stash list
    #    if [ -n "$stash_list" ]; then
    #        echo
    #        echo "    ${CYAN}-----------------GIT STASH-------------------${NC}"
    #        echo "$stash_list"
    #    fi
}


## project
#p() {
#    local CYAN='\033[0;36m'
#    local NC='\033[0m' # No Color
#
#    local folders=(
#        "$HOME/dev/mossos/microservices"
#        "$HOME/dev/microservices"
#        "$HOME/Dev/mossos/microservices"
#        "$HOME/Dev/microservices"
#        "$HOME/dev"
#        "$HOME/Dev"
#        "$HOME"
#    )
#
#    for folder in "${folders[@]}"; do
#        if [ -d "$folder" ]; then
#            # Change to the directory and exit the loop if successful
#            cd "$folder" || { echo "Failed to change directory to $folder"; return 1; }
#            echo "Changed directory to $folder"
#            break
#        fi
#    done
#
#    local git_dirs=()
#
#    # Use fd to search for directories and check if they contain a .git subdirectory
#    while IFS= read -r dir; do
#        if [ -d "$dir/.git" ]; then
#            # Add the directory to the array
#            git_dirs+=("$dir")
#        fi
#    done < <(fd -t d .)
#
#    # Use fzf to let the user choose a directory from the list
#    local selected_dir
#    selected_dir=$(printf "%s\n" "${git_dirs[@]}" | fzf --prompt="Select a Git repository directory: ")
#
#    if [ -n "$selected_dir" ]; then
#        cd "$selected_dir" || { echo "Failed to change directory to $selected_dir"; return 1; }
#        echo "Changed directory to $selected_dir"
#        gitf
#    else
#        echo "No directory selected"
#    fi
#}
#
## tmux new
#tmn() {
#    local session_name="$1"
#    
#    if [ -z "$session_name" ]; then
#        echo -n "Session name? (default: default)  > " 
#        read session_name
#        session_name=${session_name:-default}
#    fi
#    
#    tmux new -s "$session_name"
#}

