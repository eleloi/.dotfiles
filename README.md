# My Dotfiles

to install execute this script

```bash
git clone --bare git@github.com:eleloi/.dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mkdir --parents `dirname .dotfiles-backup/{}`
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
    dotfiles submodule update --recursive --init
fi
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```
