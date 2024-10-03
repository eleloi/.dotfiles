export EDITOR=nvim
export TERM=xterm-256color
export GPG_TTY=$(tty)

export LC_TIME="es_ES.UTF-8"
export LC_MONETARY="es_ES.UTF-8"
export LC_PAPER="es_ES.UTF-8"
export LC_MEASUREMENT="es_ES.UTF-8"
export LC_NAME="es_ES.UTF-8"
export LC_ADDRESS="es_ES.UTF-8"
export LC_TELEPHONE="es_ES.UTF-8"
export LC_IDENTIFICATION="es_ES.UTF-8"

$HOME/.local/bin/neofetch_custom_logo.sh

autoload -U +X bashcompinit && bashcompinit

# vi mode
bindkey -v

# edit command line in nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source ~/.config/zsh/oh-my-zsh.zsh
source ~/.config/zsh/apps.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/alias.zsh
