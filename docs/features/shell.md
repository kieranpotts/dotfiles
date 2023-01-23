# Shell features

## Shell startup scripts

A shell environment can be interactive or non-interactive. An **interactive shell** reads and writes to a user's terminal and may operate in login or non-login mode. An **interactive login shell** is spawned when a user starts their terminal program or enters a remote shell environment via SSH. Temporary **interactive non-login shells** are used to run scripts from the terminal and are invoked by the `sh` command (or `bash` etc).

A **non-interactive shell** is not associated with a terminal.

Various scripts are automatically executed by shells at startup. Which scripts are executed depends on the mode in which the shell is running. Interactive login shells look for a file called `/etc/profile` and, if the file exists and is readable, they run through the script's commands. Then the same happens for the user-level `~/.profile` file. These scripts are loaded automatically by all shells – Bash, Fish, Zsh, etc – at startup of an interactive login session.

The `bin/update.sh` script for these dotfiles will install a symlinked `~/.profile` file in your home directory. This is used to set some global environment variables that are good to have available in every interactive shell environment. (Environment variables established at interative login will be inherited by all child shells subsequently started via the terminal.) See below for documentation on the environment variables defined by these dotfiles.

The `~/.profile` file is also used to load POSIX-compliant, shell-agnostic aliases and functions, as well as a suite of other utilities that will be useful in every interactive shell environment. See below for documentation on the included utilities.

Different shells extend the standard startup behaviors with their own proprietary conventions. For example, Bash will attempt to execute `~/.bash_profile`, `~/.bash_login` or `~/.profile` – the first one it finds, in that order – when started in interactive login mode. The `bin/update.sh` script also installs a symlinked `~/.bash_profile` file in your home directory. This overrides the `~/.profile` when you login to Bash, but because the `~/.bash_profile` script includes a command to source the `~/.profile` script, Bash terminal environments will inherit the POSIX-compliant, shell-agnostic configuration defined in `~/.profile`. That baseline configuration is extended in `~/.bash_profile` with environment variables, aliases, functions and utilities that depend on Bash-specific syntax and APIs. 

The `~/.bash_profile` file is also used to configure prompt customizations – using the [Oh My Posh](https://ohmyposh.dev/) framework – and history customizations.

Finally, a `~/bashrc` file is included, too. This "Bash run command" file is used to define additional scripts that should be run every time the `bash` command is called to execute a script (which happens in interactive non-login mode). This is a good place to reset environment variables and other globals that you want to be consistent for every script you run in your terminal. As per common practice, the `~/.bashrc` file is sourced from `~/.bash_profile`, so ensuring consistent behavior of all commands run in a terminal – whether by direct invocation or via inclusion in a script.

## Shell environment variables

No environment variables are defined at this time.

## Shell aliases

### `cd`

| Alias          | Command              | Description                                         | Compatibility |
|----------------|----------------------|-----------------------------------------------------|---------------|
| `..`           | `cd ..`              | Change up one directory                             | POSIX         |
| `...`          | `cd ../..`           | Change up two directories                           | POSIX         |
| `....`         | `cd ../../..`        | Change up three directories                         | POSIX         |
| `.....`        | `cd ../../../..`     | Change up four directories                          | POSIX         |

### `git` 

| Alias          | Command              | Description                                         | Compatibility |
|----------------|----------------------|-----------------------------------------------------|---------------|
| `g`            | `git`                | Shortcut for the oft-typed `git` command            | POSIX         |

### `grep` 

| Alias          | Command              | Description                                         | Compatibility |
|----------------|----------------------|-----------------------------------------------------|---------------|
| `grep`         | `grep --color=auto`  | Enable colorized output by default                  | POSIX         |
| `fgrep`        | `fgrep --color=auto` | Enable colorized output by default                  | POSIX         |
| `egrep`        | `egrep --color=auto` | Enable colorized output by default                  | POSIX         |

### `ls` 

| Alias          | Command              | Description                                         | Compatibility |
|----------------|----------------------|-----------------------------------------------------|---------------|
| `l`            | `ls -laF --color`    | List all files (including hidden ones) in long-form | POSIX         |
| `lf`           | `ls -laF --color | grep --color=never '^-'` | List only files              | POSIX         |
| `ld`           | `ls -laF --color | grep --color=never '^d'` | List only directories        | POSIX         |
| `l`            | `ls --color`         | Enable colorized output by default                  | POSIX         |

### `mkdir` 

| Alias          | Command              | Description                                         | Compatibility |
|----------------|----------------------|-----------------------------------------------------|---------------|
| `mkdir`        | `mkdir -p`           | Make directories recursively by default             | POSIX         |

### `sudo` 

| Alias          | Command              | Description                                         | Compatibility |
|----------------|----------------------|-----------------------------------------------------|---------------|
| `s`            | `sudo`               | Shortcut for `sudo` ("superuser do")                | POSIX         |

## Shell functions

No shell functions are defined at this time.
