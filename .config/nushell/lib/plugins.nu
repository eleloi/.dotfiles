const plugins_to_have = [
    nu_plugin_skim
    nu_plugin_clipboard
]
let installed_plugins = plugin list | get filename | path basename

if ($plugins_to_have | all {|| $in in $installed_plugins}) {
    return 
}

$plugins_to_have | each { cargo install $in --locked } | ignore
$plugins_to_have | each { plugin add $"~/.cargo/bin/($in)" }

