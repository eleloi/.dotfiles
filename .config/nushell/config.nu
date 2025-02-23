# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
source ~/.cache/carapace/init.nu

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

# mcli
# if command -v mcli &> /dev/null; then
#     alias mc="mcli"
# fi
