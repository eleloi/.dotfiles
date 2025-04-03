# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $HOME/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

plugins=(
    fzf
    colored-man-pages
    command-not-found
    docker
    pep8
    pip
    sudo
    zsh-syntax-highlighting
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

# vi mode
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Starship prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

autoload -U colors && colors
setopt promptsubst

PS1=$'%F{133}${(r:$COLUMNS::\u2501:)}%f\n'$PS1

