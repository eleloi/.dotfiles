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

# colorize man pages
$env.GROFF_NO_SGR = 1

# pnpm
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"
$env.PATH = ($env.PATH | split row (char esep) | prepend $env.PNPM_HOME )

# direnv
$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}

# secrets
if (which pass | is-not-empty) {
    pass show personal/ai-api-keys-file 
    | lines     
    | split column '#'
    | get column1
    | filter {($in | str length) > 0}
    | parse "{key}={value}"
    | update value {str trim -c '"'}
    | transpose -r -d | load-env
}
