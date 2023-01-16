# Dotfiles

A baseline, extensible user profile configuration for UNIX-like systems (including Git Bash for Windows).

## Features

- Better Git defaults including extensive Git aliases via `.gitconfig`
- Global `.gitignore` file
- Customized Bash prompt
- Handy UNIX aliases

## Requirements

- UNIX-like environment ([Git Bash for Windows](https://gitforwindows.org/) is supported)
- [Oh My Posh](https://ohmyposh.dev/docs/) pre-installed

## Prerequisites

The installation script will attempt to replace the following files in your home directory. If these files already exist, they will not be replaced, but that means the dotfiles configuration will not be fully enabled on your local computer system. Therefore, before installation, you SHOULD backup these files then delete them from your home directory:

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

This will install and enable the dotfiles configuration. The first time you do this, you will need to exit the shell then login again. This process will create a new legin shell, which will load the newly-installed dotfiles configuration at startup.

To update your dotfiles with the latest configuration in this repository, `git pull` from your local downstream repository then re-run the `bin/update.sh` script. There's no need to logout and back in again. From now on, whenever you update the dotfiles, you can simply call the `reload!` function, which will re-source the updated startup scripts.

```sh
reload!
```

## Configuring

The `bin/update.sh` script will establish various symlinks in your home directory. For example, `~/.gitconfig` will be symlinked to `~/dotfiles/gitconfig`. You SHOULD NOT edit the symlinks and you SHOULD NOT edit the contents of the `~/dotfiles` directory, either. That's because these files will overwritten whenever you re-run the `bin/update.sh` script.

The `bin/update.sh` script also copies the following files into your home directory. These are not symlinked and they will not be overwritten by subsequent `bin/update.sh` executions. Therefore, you can safely edit these files without risk of your changes being lost:

- `~/.gitconfig.local`
- `~/.gitignore.local`

You MUST edit the `~/.gitconfig.local` file to configure your Git user profile information. This data will be embedded in commit objects: 

```txt
[user]
  email = you@example.com
  name = Your Name
```

You MAY make further edits to the `~/.gitconfig.local` file to override and extend any of the baseline Git configurations installed by the `bin/update.sh` script. You SHOULD NOT use the `git config --global` command to update your Git configuration. This will update the file symlinked from `~/.gitconfig` and those changes will be overwritten whenever you re-run the `bin/update.sh` script. To avoid this, you SHOULD instead edit the `~/.gitconfig.local` directly.

The `~/.gitignore.local` file MAY be used to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds a rule that will ignore any files or directories named `__TODO__` in any Git repository on your local filesystem. It means the contents of `__TODO__` paths will be private to you and will not be committed to source control. You MAY extend `~/.gitignore.local` with any additional rules you like.

**Any changes you make to any of the `*.local` files will NOT be overwritten when you re-run the `bin/update.sh` script.**

## Shell configuration

### Shell startup scripts

A shell environment can be interactive or non-interactive. An **interactive shell** reads and writes to a user's terminal. An interactive shell can be in login or non-login mode. An **interactive login shell** is spawned when a user starts their terminal program or enters a remote shell environment via SSH. An **interactive non-login shell** can be invoked from a login shell, for example by typing `sh` – or `bash` etc – and in some cases when opening terminal tabs (eg in Gnome).

A **non-interactive shell** is not associated with a terminal.

Various scripts are automatically executed by shells at startup, depending on the mode in which the shell is running. Interactive shells look for a file called `/etc/profile` and, if the file exists and is readable, run its commands. Then the same happens for the user-level `~/.profile` file. These scripts are loaded automatically by all shells – Bash, Fish, Zsh, etc – at startup of an interactive login session.

The `bin/update.sh` script installs a symlinked `~/.profile` file in your home directory. This is used to set some global environment variables that are good to have available in every interactive shell environment (environment variables established here will be inherited by child shells started via the terminal). The `~/.profile` file is also used to load POSIX-compliant, shell-agnostic aliases and functions, as well as a suite of other utilities that will be useful in every interactive shell environment.

Different shells extend the standard startup behaviors with their own proprietary conventions. For example, Bash will attempt to execute `~/.bash_profile`, `~/.bash_login` or `~/.profile` – the first one it finds, in that order – when started in interactive login mode.

The `bin/update.sh` script installs a symlinked `~/.bash_profile` file in your home directory. This overrides the `~/.profile` when you login to Bash, but because the `~/.bash_profile` script includes a command to source the `~/.profile` script, Bash terminal environments will inherit the POSIX-compliant, shell-agnostic configuration defined in `~/.profile`. That baseline configuration is extended here with environment variables, aliases, functions and utilities that depend on Bash-specific syntax and APIs. The `~/.bash_profile` file is also used to configure prompt customizations (using the [Oh My Posh](https://ohmyposh.dev/) framework) and history customizations.

Finally, a `~/bashrc` file is included, too. This "Bash run command" file is used to define additional scripts that should be run every time the `bash` command is called to execute a script (which by default is handled in interactive non-login mode). This is a good place to reset environment variables and other globals that you want to be consistent for every script you run in your terminal. As per common practice, the `~/.bashrc` file is sourced from `~/.bash_profile`, so ensuring consistent behavior of all commands run in a terminal – whether by direct invocation or via inclusion in a script.

### Aliases

TODO: List aliases

### Functions

TODO: Add functions

## Git configuration

TODO: Describe what configuration is included, and what additional configuration may be added.

## Acknowledgments

- [Thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)

-----

© Kieran Potts – [MIT](./LICENSE.txt)
