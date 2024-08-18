export EDITOR=nvim
export TERM=xterm-256color

if [[ -o login ]]; then
  neofetch
fi

autoload -U +X bashcompinit && bashcompinit

# edit command line in nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/oh-my-zsh.zsh
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/apps.zsh
