export EDITOR=nvim

# tmuxifier
if [[ -f $HOME/.tmuxifier/bin/tmuxifier ]]; then
    export PATH="$HOME/.tmuxifier/bin:$PATH"
    eval "$(tmuxifier init -)"

    alias tls="tmuxifier load-session \`tmuxifier ls|fzf\`"
fi

# color in grep
alias grep='grep --color=auto'

# pkill
function pkill() {
    ps aux | \
        fzf --height 40% --layout=reverse --prompt="Select process to kill:" --preview="" | \
        awk '{print $2}' | \
        xargs -r sudo kill
}

# dotfiles stuff
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# alias for fzf
alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'

# no pager in git
alias git='git --no-pager'
alias gitf='git fetch --all --prune && git lg'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $HOME/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

plugins=(
    fzf
    fzf-tab
    git
    colored-man-pages
    command-not-found
    docker
    npm
    pep8
    pip
    python
    systemd
    zsh-autosuggestions
    zsh-fzf-history-search
    zsh-z
    sudo
    zsh-syntax-highlighting
    zsh-nvm
)

# zstyle ':autocomplete:*' default-context history-incremental-search-backward
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

enable-fzf-tab

# Local bin path
export PATH="$PATH:$HOME/.local/bin"

# Cargo bins
export PATH="$PATH:$HOME/.cargo/bin"

# Go bins
export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"

# # ZSH vi mode
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Starship prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"


alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh

# flatpak
export "XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/eleloi/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

if [[ -o login ]]; then
  neofetch
fi

alias tmux="tmux -f ~/.config/tmux/tmux.conf"

eval "$(zoxide init zsh)"

export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# pnpm
export PNPM_HOME="/home/eleloi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# lsd
alias ls='lsd'
alias l='ls'
alias la='lsd -a'
alias ll='lsd -a -l'

# remote poetry
alias remotepoetry='PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring poetry'

# bob nvim binary
export PATH=/home/eleloi/.local/share/bob/nvim-bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# huggingface
export HF_HUB_ENABLE_HF_TRANSFER=1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mcli mcli

# secrets
if [[ -f $HOME/.config/secrets/openai_api_key ]]; then
  export OPENAI_API_KEY="$(cat $HOME/.config/secrets/openai_api_key)"
fi

# edit command line in nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# colorize man pages
export GROFF_NO_SGR=1

