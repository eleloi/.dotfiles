# zoxide
zoxide init --cmd cd fish | source

# Local bin path
fish_add_path ~/.local/bin

# Cargo bins
fish_add_path ~/.cargo/bin

# Go bins
fish_add_path ~/go/bin /usr/local/go/bin

# pnpm
set PNPM_HOME ~/.local/share/pnpm
fish_add_path $PNPM_HOME

# bob
fish_add_path ~/.local/share/bob/nvim-bin

# colorize man pages
set GROFF_NO_SGR 1

# huggingface
set HF_HUB_ENABLE_HF_TRANSFER 1
