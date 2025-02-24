if (which starship | is-empty) {
    return
}

if not ($nu.data-dir | path join 'vendor/autoload/starship.nu' | path exists) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
}

$env.STARSHIP_SHELL = "nu"

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = "(norm) "
$env.PROMPT_MULTILINE_INDICATOR = "::: "
