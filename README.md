# Dotfiles

A baseline, extensible user profile configuration for UNIX-like systems (including Git Bash for Windows).

## Features

- Better Git defaults
- Extensive suite of useful Git aliases
- Global `.gitignore` file
- Customized Bash prompt
- Handy UNIX aliases

## Requirements

- UNIX-like environment ([Git Bash for Windows](https://gitforwindows.org/) is supported)
- [Git](https://git-scm.com/) >= v29
- [Oh My Posh](https://ohmyposh.dev/docs/) pre-installed

## Prerequisites

The installation script will attempt to replace the following files in your home directory. If these files already exist, they will not be replaced, but that means the dotfiles configuration will not be fully enabled on your computer. Therefore, before installation, you SHOULD backup and delete these files from your home directory:

- `~/.bash_profile`
- `~/.bashrc`
- `~/.gitconfig`
- `~/.profile`

## Installation

Clone this repository to any location on your local filesystem:

```sh
git clone git@github.com:kieranpotts/dotfiles.git
```

Change to the root directory of the cloned repository and run the `bin/update.sh` script. Bash is the only shell supported at this time. If using Git Bash for Windows, the shell MUST be run with administrator privileges in order for the necessary symlinks to be created.

```sh
cd dotfiles
bash bin/update.sh
```

This will install and enable the dotfiles configuration. The first time you do this, you will need to exit the shell then login again. This process will create a new login shell, which will load the newly-installed dotfiles configuration at startup.

To update your dotfiles with the latest configuration in this repository, `git pull` from your local repository then re-run the `bin/update.sh` script. There's no need to logout and back in again. From now on, whenever you update the dotfiles, you can simply call the `reload!` function, which will re-source the updated startup scripts.

```sh
reload!
```

## Configuring

The `bin/update.sh` script will establish various symlinks in your home directory. For example, `~/.gitconfig` will be symlinked to `~/dotfiles/gitconfig`. You SHOULD NOT edit the symlinks and you SHOULD NOT edit the contents of the `~/dotfiles` directory, either. That's because these files will be overwritten whenever you re-run the `bin/update.sh` script.

The following files will be added to your home directory. These are not symlinked and they will not be overwritten by subsequent `bin/update.sh` executions. Therefore, you can safely edit these files without risk of your changes being lost:

- `~/.local.gitconfig`
- `~/.local.gitignore`

You MUST edit the `~/.local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects: 

```txt
[user]
  email = you@example.com
  name = Your Name
```

You MAY make further edits to the `~/.local.gitconfig` file. This is how you can override and extend the baseline Git configurations (in `~/.gitconfig`). You SHOULD NOT use the `git config --global` command to update your Git configuration. This will update the file symlinked from `~/.gitconfig` and those changes will be overwritten whenever you re-run the `bin/update.sh` script. To avoid this, you SHOULD instead edit the `~/.local.gitconfig` directly.

The `~/.local.gitignore` file MAY be used to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds a rule that will ignore any files or directories named `__TODO__` in any Git repository on your local filesystem. It means the contents of `__TODO__` paths will be private to you and will not be committed to source control. You MAY extend `~/.local.gitignore` with any additional rules you like.

**Any changes you make to any of the "local" Git files will NOT be overwritten when you re-run the `bin/update.sh` script.**

## Shell configuration

### Shell startup scripts

A shell environment can be interactive or non-interactive. An **interactive shell** reads and writes to a user's terminal. An interactive shell can be in login or non-login mode. An **interactive login shell** is spawned when a user starts their terminal program or enters a remote shell environment via SSH. An **interactive non-login shell** can be invoked from a login shell by typing the `sh` command – or `bash` etc – and in some cases when opening terminal tabs (eg in Gnome).

A **non-interactive shell** is not associated with a terminal.

Various scripts are automatically executed by shells at startup. Which scripts are run depends on the mode in which the shell is running. Interactive shells look for a file called `/etc/profile` and, if the file exists and is readable, they run through the script's commands. Then the same happens for the user-level `~/.profile` file. These scripts are loaded automatically by all shells – Bash, Fish, Zsh, etc – at startup of an interactive login session.

The `bin/update.sh` script installs a symlinked `~/.profile` file in your home directory. This is used to set some global environment variables that are good to have available in every interactive shell environment. (Environment variables established at interative login will be inherited by all child shells subsequently started via the terminal.) See below for documentation on the environment variables defined by these dotfiles.

The `~/.profile` file is also used to load POSIX-compliant, shell-agnostic aliases and functions, as well as a suite of other utilities that will be useful in every interactive shell environment. See below for documentation on the included utilities.

Different shells extend the standard startup behaviors with their own proprietary conventions. For example, Bash will attempt to execute `~/.bash_profile`, `~/.bash_login` or `~/.profile` – the first one it finds, in that order – when started in interactive login mode.

The `bin/update.sh` script installs a symlinked `~/.bash_profile` file in your home directory. This overrides the `~/.profile` when you login to Bash, but because the `~/.bash_profile` script includes a command to source the `~/.profile` script, Bash terminal environments will inherit the POSIX-compliant, shell-agnostic configuration defined in `~/.profile`. That baseline configuration is extended in `~/.bash_profile` with environment variables, aliases, functions and utilities that depend on Bash-specific syntax and APIs. 

The `~/.bash_profile` file is also used to configure prompt customizations (using the [Oh My Posh](https://ohmyposh.dev/) framework) and history customizations.

Finally, a `~/bashrc` file is included, too. This "Bash run command" file is used to define additional scripts that should be run every time the `bash` command is called to execute a script (which happens in interactive non-login mode). This is a good place to reset environment variables and other globals that you want to be consistent for every script you run in your terminal. As per common practice, the `~/.bashrc` file is sourced from `~/.bash_profile`, so ensuring consistent behavior of all commands run in a terminal – whether by direct invocation or via inclusion in a script.

### Shell environment variables

TODO: List environment variables

### Shell aliases

TODO: List aliases

### Shell functions

TODO: Add functions

## Git configuration

TODO: Describe what configuration is included, and what additional configuration may be added.

### Git aliases

The following Git aliases provide shortcut commands for common source control operations. This table provides a short summary of each alias's behavior – see the inline code comments in `dotfiles/gitconfig` for more documentation.

| Command                    | Description                                     |
|----------------------------|-------------------------------------------------|
| `git aliases`              | List all available aliases                      |
| `git amend`                | Amend the last commit with all working changes  |
| `git br`                   | Create a branch, switch to it and push upstream |
| `git branches`             | List all branches by order of last commit       |
| `git cm (-m "[comment]")`  | Stage and commit all changes in working tree    |
| `git changed [hash]`       | List the files changed in a specified commit    |
| `git changes`              |  |
| `git cl`                   | Shortcut for `git clone`                        |
| `git co`                   |  |
| `git configure`            |  |
| `git contrib`              |  |
| `git current`              |  |
| `git default`              |  |
| `git delete`               |  |
| `git delete-force`         |  |
| `git discard`              |  |
| `git down`                 |  |
| `git download`             |  |
| `git downstream`           |  |
| `git experiment`           |  |
| `git feat(ure)`            |  |
| `git fell ([branch])`      |  |
| `git fetched`              |  |
| `git filelog`              | List all the commits that changed a file        |
| `git fix|bug "[comment]"`  |  |
| `git fixup`                |  |
| `git fixup HEAD^`          |  |
| `git fixup [sha]`          |  |
| `git fixup :/foo`          |  |
| `git fast-forward|ff`      |  |
| `git graph`                |  |
| `git history`              |  |
| `git k`                    | Opens `gitk`                                    |
| `git last`                 |  |
| `git maint`                |  |
| `git new`                  |  |
| `git nfr|quality`          |  |
| `git orphan`               |  |
| `git orphan-fresh`         |  |
| `git pick`                 |  |
| `git recent`               |  |
| `git refactor`             |  |
| `git remotes`              |  |
| `git reword`               |  |
| `git state`                |  |
| `git squash`               |  |
| `git stashed`              |  |
| `git sw`                   |  |
| `git sync`                 |  |
| `git tags`                 |  |
| `git track`                |  |
| `git tracking`             |  |
| `git unamend`              |  |
| `git uncommit`             |  |
| `git undo`                 |  |
| `git unstage`              |  |
| `git untrack`              |  |
| `git up`                   |  |
| `git up-force`             |  |
| `git upstream`             |  |
| `git versions`             |  |
| `git wip`                  |  |

## Acknowledgments

- [Thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)
- [Nicola Paolucci's dotfiles](https://github.com/durdn/cfg)
- [YADR – Yet Another Dotfile Repo](https://github.com/skwp/dotfiles)
- [Git Wiki: Aliases](https://git.wiki.kernel.org/index.php/Aliases)

-----

© Kieran Potts – [MIT](./LICENSE.txt)
