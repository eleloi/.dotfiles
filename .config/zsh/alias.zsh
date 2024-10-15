# color in grep
alias grep='grep --color=auto'

# dotfiles stuff
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lazydot='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# alias for fzf
alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'

# ssh, allows kitty to work with ssh
alias ssh='env TERM=xterm-256color ssh' 

# tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

# lsd
alias l='lsd'
alias la='l --almost-all'

alias ls='lsd --blocks=size,date,name --date=relative'
alias lsa='ls --almost-all'

alias ll='lsd --long'
alias lla='ll --almost-all'

# remote poetry
alias remotepoetry='PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring poetry'

# tmuxifier
if [[ -f $HOME/.tmuxifier/bin/tmuxifier ]]; then
    export PATH="$HOME/.tmuxifier/bin:$PATH"
    eval "$(tmuxifier init -)"

    alias tls="tmuxifier load-session \`tmuxifier ls|fzf\`"
fi

