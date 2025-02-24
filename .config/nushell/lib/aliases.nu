# color in grep
alias grep = grep --color=auto

# dotfiles stuff
alias dotfiles = git --git-dir=( $env.HOME )/.dotfiles/ --work-tree=( $env.HOME )
alias lazydot = lazygit --git-dir=( $env.HOME )/.dotfiles/ --work-tree=( $env.HOME )

# alias for  f zf
alias fzf = fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"

# ssh, allows kitty to work with ssh
alias ssh = env TERM=xterm-256color ssh 

# tmux
alias tmux = tmux -f ~/.config/tmux/tmux.conf
