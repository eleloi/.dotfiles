export def main [] {
    $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
    mkdir ~/.cache/carapace
    carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
    source ~/.cache/carapace/init.nu
}

