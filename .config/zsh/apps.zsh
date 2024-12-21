# zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Local bin path
export PATH="$PATH:$HOME/.local/bin"

# Cargo bins
export PATH="$PATH:$HOME/.cargo/bin"

# Go bins
export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"

# flatpak
export "XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/eleloi/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# pnpm
export PNPM_HOME="/home/eleloi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bob nvim binary
export PATH=/home/eleloi/.local/share/bob/nvim-bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# huggingface
export HF_HUB_ENABLE_HF_TRANSFER=1

# secrets
if [[ -f $HOME/.config/secrets/openai_api_key ]]; then
  export OPENAI_API_KEY="$(cat $HOME/.config/secrets/openai_api_key)"
fi

# colorize man pages
export GROFF_NO_SGR=1

# mcli
complete -o nospace -C /usr/bin/mcli mcli

# direnv
if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi
