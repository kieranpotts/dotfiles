# Configuration

The `bin/update.sh` script will establish various symlinks in your home directory. For example, `~/.gitconfig` will be symlinked to `~/dotfiles/gitconfig`. You SHOULD NOT edit the symlinks and you SHOULD NOT edit the contents of the `~/dotfiles` directory, either. That's because these files will be overwritten whenever you re-run the `bin/update.sh` script.

The following files will be added to your home directory. These are not symlinked and they will not be overwritten by subsequent `bin/update.sh` executions. Therefore, you can safely edit these files without risk of your changes being lost. It's via these files that you configure and customize the dotfiles installed from the repository:

- `~/.local.gitconfig`
- `~/.local.gitignore`

You MUST edit the `~/.local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects: 

```
[user]
  email = you@example.com
  name = Your Name
```

When you ran the installation script, your previous Git configuration would have been backed up in the `~/.backup.gitconfig` file. You SHOULD review the contents of this file and copy any other configuration you wish to keep to the new `~/.local.gitconfig` file. This is where you will now override and extend the baseline Git configuration installed from this repository.

Note, you SHOULD NOT use the `git config --global` command to update your Git configuration. This will update the file symlinked from `~/.gitconfig` and those changes will be overwritten whenever you re-run the `bin/update.sh` script. To avoid this, you SHOULD instead edit the `~/.local.gitconfig` directly.

In addition, you can edit the `~/.local.gitignore` file to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds rules that will ignore any files or directories named `__TODO__` or `__NOTES__` in any Git repository anywhere on your local filesystem. It means the contents of these paths will be private to you and will not be committed to source control.
