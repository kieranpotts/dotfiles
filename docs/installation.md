# Installation

To install these dotfiles, fork-and-clone the upstream repository to any location on your local machine, then follow the steps below. This process needs to be repeated for each environment – so, once for WSL and once for Git Bash, if using both on the same Windows machine.

## Run the `./install.sh` script

Change to the root directory of the cloned repository and run the `./install.sh` shell script.

> **Important:** For Git Bash on Windows, run the terminal program as administrator.

```sh
cd /path/to/dotfiles
sh install.sh
```

The first time you run this, you will need to exit your terminal program then restart it. Doing so will create a new login shell, which will load the newly-installed dotfiles at startup.

The `install.sh` script can be safely run multiple times, and it is RECOMMENDED to re-run it whenever you `git pull` the latest changes from the upstream dotfiles repository, so that any new required symlinks are created.

## Create symlinks to the configuration files

Configuration files are included for various command line development tools. To use these configurations, symlinks must be created to them from the filesystem locations the programs expect them to be. The `./install.sh` script does this automatically for non-Windows environments. To use the LazyGit, Neovim, and tmux configurations in Git Bash for Windows, run Windows Powershell in administrator mode and execute the following commands, changing the filesystem paths as required.

```powershell
# LazyGit
New-Item -ItemType SymbolicLink `
  -Path "C:\Users\[User]\AppData\Roaming\lazygit\config.yml" `
  -Target "C:\path\to\dotfiles\etc\lazygit\config.yml" `
  -Force

# Neovim
New-Item -ItemType SymbolicLink `
  -Path "C:\Users\[User]\AppData\Local\nvim\init.vim" `
  -Target "C:\path\to\dotfiles\etc\nvim\init.vim" `
  -Force

# tmux
New-Item -ItemType SymbolicLink `
  -Path "C:\Users\[User]\.tmux.conf" `
  -Target "C:\path\to\dotfiles\etc\tmux\tmux.conf" `
  -Force
New-Item -ItemType SymbolicLink `
  -Path "C:\Users\[User]\.tmux\dev" `
  -Target "C:\path\to\dotfiles\etc\tmux\inc\dev" `
  -Force
```

## GitHub Codespaces configuration

The `./install.sh` script can be used to bootstrap your GitHub Codespaces environments, too. Only a subset of the dotfiles configuration are enabled in Codespaces – limited only to Bash aliases and functions.

Go to your [GitHub Codespaces options](https://github.com/settings/codespaces) and enable the following setting.

![](./_/github-automatically-install-dotfiles.png)
