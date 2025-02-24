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
$env.EDITOR = 'nvim'
$env.config.history.file_format = "sqlite"
$env.config.edit_mode = "vi"
$env.config.completions.algorithm = "fuzzy"
$env.config.table.mode = "markdown"
$env.config.table.index_mode = "auto"
$env.LS_COLORS = (vivid generate rose-pine)

use aliases.nu *
use carapace.nu 
source '~/.config/nushell/lib/zoxide.nu'
