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
