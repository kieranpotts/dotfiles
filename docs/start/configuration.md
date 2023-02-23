# Configuration

The `bin/update!` script will establish various symlinks in your home directory. For example, `~/.gitconfig` will be symlinked to `~/dotfiles/gitconfig`. You SHOULD NOT edit the symlinks and you SHOULD NOT edit the contents of the `~/dotfiles` directory, either. That's because these files will be overwritten whenever you re-run the `bin/update!` script.

The following files will be added to your home directory. These are not symlinked and they will not be overwritten by subsequent `bin/update!` executions. Therefore, you can safely edit these files without risk of your changes being lost. It's via these files that you extend the dotfiles configuration distributed via this repository:

- `~/local.profile`
- `~/local.bash_profile`
- `~/local.bashrc`
- `~/local.gitconfig`
- `~/local.gitignore`

If you already had files like `.profile` or `.gitconfig` in your user directory, the `bin/update!` script will have created backups of these files before replacing them. The backup files will be named with the "backup" prefix. For example, your existing `~/.bashrc` file will be renamed `~/backup.bashrc`. You may need to manually copy-and-paste existing configurations from the old "backup" files to the new "local" files.

## Git configuration

You MUST edit the `~/local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects: 

```txt
[user]
  email = you@example.com
  name = Your Name
```

When you ran the `bin/update!` script, your previous Git configuration would have been backed up to `~/backup.gitconfig`. You SHOULD review the contents of this file and copy any other configuration you wish to keep to the new `~/local.gitconfig` file.

Note, from now on you SHOULD NOT use the `git config --global` command to update your Git configuration. If you do, this command will update the file symlinked from `~/.gitconfig` and the changes will be overwritten next time you run the `bin/update!` script. To avoid this, you SHOULD instead edit the `~/local.gitconfig` file directly.

You MAY also edit the `~/local.gitignore` file to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds rules to ignore files or directories named `__TODO__` or `__NOTES__` in any Git repository anywhere on your local filesystem. It means the contents of these paths will be private to you and will not be committed to source control.

## Shell prompt customization

The `local.bash_profile` file, copied to your home directory, includes the following command:

```sh
eval "$(oh-my-posh init bash --config ~/dotfiles/poshthemes/hacks.omp.json 2> /dev/null)"
```

You can change this command to load different themes for your shell's prompt line. More themes can be installed by running the commands below.

```sh
$ mkdir [path/to/install/dir]
$ cd [path/to/install/dir]
$ wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O themes.zip
$ unzip themes.zip
$ chmod u+rw *.json
$ rm themes.zip
```

(Note, `wget` is not pre-installed in Git Bash. Download the [binary from here](https://eternallybored.org/misc/wget/)

Next, change the value of the `--config` parameter to reference a theme file that you want to try out. For example:

```sh
eval "$(oh-my-posh init bash --config ~/poshthemes/clean-detailed.omp.json)"
```

To enable the theme, type `reload!` into your terminal, which will re-source your shell's startup scripts.

Oh My Posh is highly customizable — see [the website](https://ohmyposh.dev/docs/) for more options. What is great about Oh My Posh is that, as a cross-platform framework, configurations can be shared between shells. So you can expose your Powershell, Git Bash and WSL environments to the same configuration, so you have a consistent prompt in every terminal.
