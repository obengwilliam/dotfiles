# Dotfiles

## Features

## Installation

## Using With Existing Files (Bare Repo)

This repo is intended to be used as a bare git repo with your `$HOME` as the work tree, so you do not need symlinks.

### Quick Setup Script

Use the script to clone, back up existing files, and check out dotfiles:

```bash
chmod +x ~/init_dotfile.sh
~/init_dotfile.sh
```

To use a different repo URL:

```bash
~/init_dotfile.sh https://github.com/obengwilliam/dotfiles.git
```

Preview what would be backed up (no changes):

```bash
~/init_dotfile.sh --dry-run
```

Or use the Makefile targets:

```bash
make bootstrap
make dry-run
```

1. Clone the repo as bare.
```bash
git clone --bare https://github.com/obengwilliam/dotfiles.git ~/.dotfiles
```

2. Create the alias and hide untracked files (so your entire `$HOME` does not show up in `status`).
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

3. Checkout. If you already have dotfiles in place, this may fail due to conflicts.
```bash
dotfiles checkout
```

4. If checkout fails, back up the conflicting files, then retry.
```bash
mkdir -p ~/.dotfiles_backup
dotfiles checkout 2>&1 | grep -E '^\s' | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles_backup/{}
dotfiles checkout
```

5. Use the repo.
```bash
dotfiles status
dotfiles add ~/.zshrc
dotfiles commit -m "Update zshrc"
dotfiles push
```

## References
- [Stratus3D](https://github.com/Stratus3D/dotfiles)
