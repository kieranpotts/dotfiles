# Configuration

The `bin/update.sh` script will establish various symlinks in your home directory. For example, `~/.gitconfig` will be symlinked to `~/dotfiles/gitconfig`. You SHOULD NOT edit the symlinks and you SHOULD NOT edit the contents of the `~/dotfiles` directory, either. That's because these files will be overwritten whenever you re-run the `bin/update.sh` script.

The following files will be added to your home directory. These are not symlinked and they will not be overwritten by subsequent `bin/update.sh` executions. Therefore, you can safely edit these files without risk of your changes being lost. It's via these files that you configure and customize the dotfiles installed from the repository:

- `~/local.profile`
- `~/local.bash_profile`
- `~/local.bashrc`
- `~/local.gitconfig`
- `~/local.gitignore`

## Git configuration

You MUST edit the `~/local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects: 

```txt
[user]
  email = you@example.com
  name = Your Name
```

When you ran the installation script, your previous Git configuration would have been backed up to `~/backup.gitconfig`. You SHOULD review the contents of this file and copy any other configuration you wish to keep to the new `~/local.gitconfig` file. This is where you will now override and extend the baseline Git configuration installed from this repository.

Note, you SHOULD NOT use the `git config --global` command to update your Git configuration. This will update the file symlinked from `~/.gitconfig` and those changes will be overwritten whenever you re-run the `bin/update.sh` script. To avoid this, you SHOULD instead edit the `~/local.gitconfig` directly.

In addition, you can edit the `~/local.gitignore` file to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds rules that will ignore any files or directories named `__TODO__` or `__NOTES__` in any Git repository anywhere on your local filesystem. It means the contents of these paths will be private to you and will not be committed to source control.

## Shell configuration

### Prompt customization

The `local.bash_profile` file, copied to your home directory, includes the following command:

```sh
eval "$(oh-my-posh init bash --config ~/dotfiles/poshthemes/agnosterish.omp.json 2> /dev/null)"
```

You can change this command to load different themes for your terminal. These dotfiles install a few samples themes in `~/dotfiles/poshthemes/*`. You can install more themes by running the command below.  (Note, `wget` is not pre-installed in Git Bash. Download the [binary from here](https://eternallybored.org/misc/wget/)

```sh
$ mkdir [path/to/install/dir]
$ cd [path/to/install/dir]
$ wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O themes.zip
$ unzip themes.zip
$ chmod u+rw *.json
$ rm themes.zip
```

Then change the value of the `--config` parameter to reference a theme file that you want to try out. For example:

```sh
eval "$(oh-my-posh init bash --config ~/poshthemes/clean-detailed.omp.json)"
```

To enable the theme, type `reload!` into your terminal, which will re-source your shell startup scripts.

Oh My Posh is highly customizable — see [the website](https://ohmyposh.dev/docs/) for more options. What is great about Oh My Posh is that, as a consistent cross-platform framework, configurations can be shared between shells. Thus, you can expose your Powershell, Git Bash and WSL environments to the same configuration, so you have a consistent prompt in every terminal.
