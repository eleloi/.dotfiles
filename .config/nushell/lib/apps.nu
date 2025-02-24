
echo "Apps"

# Zoxide
source '~/.config/nushell/lib/zoxide.nu'

# Local bin
$env.PATH ++= ["~/.local/bin"]

# Cargo
$env.PATH ++= ["~/.cargo/bin"]

# Go
$env.PATH ++= ["~/go/bin", "/usr/local/go/bin"]

# flatpack
$env.XDG_DATA_DIRS = [
    ...($env | get 'XDG_DATA_DIRS'? | default [])
    "/var/lib/flatpak/exports/share",
    "~/.local/share/flatpak/exports/share"
]

# pnpm
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"
$env.PATH = ($env.PATH | split row (char esep) | prepend $env.PNPM_HOME )



# export PNPM_HOME="/home/eleloi/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# 
# # bob nvim binary
# export PATH=/home/eleloi/.local/share/bob/nvim-bin:$PATH
# 
# # nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# 
# # pyenv
# if command -v pyenv &> /dev/null; then
#     export PYENV_ROOT="$HOME/.pyenv"
#     [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init -)"
# fi
# 
# # huggingface
# export HF_HUB_ENABLE_HF_TRANSFER=1
# 
# # secrets
# if command -v pass &> /dev/null;then
#     export eval $(pass show personal/ai-api-keys-file)
# fi
# 
# # colorize man pages
# export GROFF_NO_SGR=1
# 
# # mcli
# complete -o nospace -C /usr/bin/mcli mcli
# 
# # direnv
# if command -v direnv &> /dev/null; then
#     eval "$(direnv hook zsh)"
# fi
