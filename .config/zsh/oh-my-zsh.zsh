# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $HOME/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

plugins=(
    fzf
    fzf-tab
    colored-man-pages
    command-not-found
    docker
    pep8
    pip
    zsh-autosuggestions
    zsh-fzf-history-search
    zsh-z
    sudo
    zsh-syntax-highlighting
    zsh-nvm
)

# docker enable stacking autocompletion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

enable-fzf-tab

# vi mode
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Starship prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

autoload -U colors && colors
setopt promptsubst

PS1=$'%F{133}${(r:$COLUMNS::\u2501:)}%f\n'$PS1

