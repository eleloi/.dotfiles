# color in grep
export alias grep = grep --color=auto

# dotfiles stuff
export alias dotfiles = git --git-dir=( $env.HOME )/.dotfiles/ --work-tree=( $env.HOME )
export alias lazydot = lazygit --git-dir=( $env.HOME )/.dotfiles/ --work-tree=( $env.HOME )

# alias for  f zf
export alias fzf = fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"

# ssh, allows kitty to work with ssh
export alias ssh = env TERM=xterm-256color ssh 

# tmux
export alias tmux = tmux -f ~/.config/tmux/tmux.conf
