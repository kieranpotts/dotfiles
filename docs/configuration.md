# Configuration

The `bin/update!` script will establish various symlinks in your home directory. For example, `~/.gitconfig` will be symlinked to `~/dotfiles/gitconfig`. You SHOULD NOT edit the symlinks and you SHOULD NOT edit the contents of the `~/dotfiles` directory, either. That's because these files will be overwritten whenever you re-run the `bin/update!` script.

The following files will be added to your home directory. These are not symlinked and they will not be overwritten by subsequent `bin/update!` executions. Therefore, you can safely edit these files without risk of your changes being lost. It's via these files that you configure and customize the dotfiles installed from the repository:

- `~/local.profile`
- `~/local.bash_profile`
- `~/local.bashrc`
- `~/local.gitconfig`
- `~/local.gitignore`

If you already had files like `.profile` or `.gitconfig` in your user directory, the `bin/update!` script will have created backups of these files before replacing them. The backup files will be named with the "backup" prefix. For example, your existing `~/.bashrc` file will be renamed `~/backup.bashrc`. You may need to manually copy-and-paste existing configurations from the "backup" files to the new "local" files.

## Git configuration

You MUST edit the `~/local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects:

```txt
[user]
  email = you@example.com
  name = Your Name
```

When you ran the `bin/update!` script, your previous Git configuration would have been backed up to `~/backup.gitconfig`. You SHOULD review the contents of this file and copy any other configuration you wish to keep to the new `~/local.gitconfig` file. This is where you will now override and extend the baseline Git configuration installed from this repository.

Note, you SHOULD NOT use the `git config --global` command to update your Git configuration. This will update the file symlinked from `~/.gitconfig` and those changes will be overwritten whenever you re-run the `bin/update!` script. To avoid this, you SHOULD instead edit the `~/local.gitconfig` directly.

In addition, you can edit the `~/local.gitignore` file to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds rules that will ignore any files or directories named `__TODO__` or `__NOTES__` in any Git repository anywhere on your local filesystem. It means the contents of these paths will be private to you and will not be committed to source control.

## Shell configuration

### Prompt customization

The `local.bash_profile` file, copied to your home directory, includes the following command:

```sh
eval "$(oh-my-posh init bash --config ~/dotfiles/poshthemes/hacks.omp.json 2> /dev/null)"
```

You can change this command to load different themes for your terminal. More themes can be installed by running the commands below.

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

To enable the theme, type `reload!` into your terminal, which will re-source your shell startup scripts.

Oh My Posh is highly customizable — see [the website](https://ohmyposh.dev/docs/) for more options. What is great about Oh My Posh is that, as a consistent cross-platform framework, configurations can be shared between shells. Thus, you can expose your Powershell, Git Bash and WSL environments to the same configuration, so you have a consistent prompt in every terminal.

## Windows Terminal settings

My Windows Terminal settings are included with these dotfiles, for easy portability between machines. To enable the settings:

1.  Open Windows Terminal.

2.  Go to **Settings** and follow the link to **Open JSON File**.

3.  In **Explorer** navigate to the directory containing your Windows Terminal `settings.json` file.

4.  Close Windows Terminal and delete the `settings.json` file.

5.  Run Windows Powershell as Administrator. Use the old Powershell program, not the new Windows Terminal, as doing so will recreate WT's `settings.json` file – which MUST not exist for the next step to succeed.

6.  Run the following Powershell command to create a hard link to the `etc/wt.json` file distributed in this repository. Update the paths as necessary.

    ```powershell
    New-Item -ItemType SymbolicLink -Path "C:\Users\Kieran\AppData\Local\Packages\Microsoft.WindowsTerminal_[hash]\LocalState\settings.json" -Target "C:\path\to\dotfiles\etc\wt.json"
    ```

7.  Open **Windows Terminal** to check the changes are effective.

### Other WT settings

WT's `settings.json` supports a `startupActions` property that can be used to [configure default command line arguments](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/startup#startup-actions), which will be used if no arguments are provided to `wt.exe` at execution. Example:

```json
{
  "startupActions": "--profile \"Git Bash\" --title \"Personal\" -d \"C:\\dev\\personal\"; new-tab --profile \"Git Bash\" --title \"Work\" -d \"C:\\dev\\work\"; focus-tab -t 1 "
}
```

Because the default tabs and panes I have vary from project to project, I tend to use different [command line arguments](https://learn.microsoft.com/en-us/windows/terminal/command-line-arguments) to start Windows Terminal on different machines. For this reason I prefer to create a `.bat` file for starting up Windows Terminal. Example:

```bat
start "Windows Terminal" wt.exe --profile "Git Bash" --title "Personal" -d "C:\dev\personal"; new-tab --profile "Git Bash" --title "Work" -d "C:\dev\work"; focus-tab -t 1
```

Alternatively, you could bind the `wt` command to a hotkey using [AutoHotkey](https://www.autohotkey.com/), or just create a Windows shortcut and pin it to your desktop or taskbar.

## VS Code preferences

When you've installed the Nerd Font of your choice, simply set your terminal to use that font. If you have Git Bash configured as the default profile for VSCode's integrated terminal, you will also need to enable the Nerd Font in VSCode's integrated terminal too, eg:

```json
{
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.fontFamily": "Nerd NF"
}
```
