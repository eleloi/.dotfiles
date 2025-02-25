def pkill [] {
    ps | sort-by cpu --reverse | sk --format {get name} --preview {} | kill $in.pid
}

def pet-register-prev [] {
    let last = history | last
    pet new ($last.command)
}

def gitf [] {
    git fetch --all --prune

    if (which onefetch | is-not-empty) {
        onefetch
    } else {
        echo "onefetch is not installed"
    }

    echo "    ${CYAN}-------------------GIT LOG--------------------${NC}"
    git lg -10

    echo
    echo "    ${CYAN}-----------------GIT STATUS-------------------${NC}"
    git s

    if (git stash list | lines | is-not-empty) {
        echo
        echo "    ${CYAN}-----------------GIT STASH-------------------${NC}"
        git stash list|lines|split column ":" stash desc parent
    }
}

def p --env [] {

    if (which tre | is-empty) {
        echo "Tre is not instaled"
        return
    }


    let folders = [
        "~/dev/mossos/microservices"
        "~/dev/microservices"
        "~/Dev/mossos/microservices"
        "~/Dev/microservices"
        "~/dev"
        "~/Dev"
        "~"
    ]


    for f in $folders {
        if ( $f | path exists ) {
            cd $f
            break
        }
    }

    ls ...(glob **/.git) --directory |
        where name !~ 'dev_env' |
        update name {|row| ($row.name | path dirname)} |
        get name |
        sk --preview {tre -l 3 -d -c always $in} |
        cd $in

    gitf
}

def tmn [name = 'default'] {
    if (which tmux | is-empty) {
        return
    }

    tmux new -s ($name)
}
