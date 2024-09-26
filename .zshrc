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


if [[ -o login ]]
then
    if command -v fastfetch &> /dev/null
    then
        fastfetch
    elif command -v neofetch &> /dev/null
    then
        neofetch
    fi
fi

autoload -U +X bashcompinit && bashcompinit

# edit command line in nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source ~/.config/zsh/oh-my-zsh.zsh
source ~/.config/zsh/apps.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/alias.zsh
