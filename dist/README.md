# The `dist` directory

The `dist` directory contains "global" dotfiles that are intended to be symlinked from the user's home directory. These are not intended to be editable by the user. Instead, the user is able to extend the "global" dotfiles via "local" ones.

## Shell startup scripts

A shell environment can be interactive or non-interactive:

- An **interactive shell** reads and writes to a user's terminal and may operate in login or non-login mode:

  - An **interactive login shell** is typically spawned when a user logs in directly to a TTY or enters a remote shell environment via SSH.

  - An **interactive non-login shell** is what you get when you open a new window in most Linux terminal emulators, or when you invoke a new shell from within an existing one (eg. by typing `bash`).

- A **non-interactive shell** is not associated with a user interface (terminal). It is the mode used to run shell scripts.

Various scripts are automatically executed by shells at startup. Which scripts are executed depends on the mode in which the shell is running.

Bourne-compatible shells – `sh`, Bash, Dash, Ksh – look for a file called `/etc/profile` at the startup of a new interactive login session and, if the file exists and is readable, execute its commands. Then the same happens for the user-level `~/.profile` file. However, Zsh and Fish do _not_ read these files by default. Zsh uses `/etc/zprofile` and `~/.zprofile` for login shells, and Fish has its own configuration system rooted at `~/.config/fish/config.fish`. Fish is not POSIX-compatible, so it does not source `/etc/profile` or `~/.profile` directly.

Different shells extend the standard startup behaviors with their own proprietary conventions. For example, Bash will attempt to execute `~/.bash_profile`, `~/.bash_login` or `~/.profile` – the first one it finds, in that order – when started in interactive login mode. The `~/.bash_profile` file, if it exists, takes precedence over `~/.profile`. In addition, Bash reads a file called `~/.bashrc` ("run commands"), if it exists, whenever a new _interactive non-login_ Bash shell is spawned. Importantly, `~/.bashrc` is _not_ sourced automatically for interactive login shells, nor for non-interactive shells – which is the reason for the sourcing trick described at the end of this document.

As a general rule, `~/.bash_profile` should be used to set environment variables and to run commands that need to be run only once per login session, while `~/.bashrc` should be used to do things every time Bash is run, regardless of the mode in which it operates. The `~/.bashrc` file is a good place to define aliases and functions, and to customize the prompt and history.

However, when it comes to _local_ shell environments, confusingly different terminal programs launch them differently. Whether a shell starts as a login shell depends on the terminal's configured launch command, not on the terminal program itself. macOS's Terminal.app and iTerm2, for example, run their shells in interactive login mode by default, as do WSL distros launched from Windows Terminal. Most Linux terminal emulators (GNOME Terminal, Konsole, xterm, etc.) instead spawn their startup shell in interactive non-login mode by default.

> **Tip:** You can check which mode a shell is running in by typing:
>
> ```
> shopt login_shell
> ```

To ensure a consistent local Bash environment in all terminals, the most reliable approach is to include a command in `~/.bash_profile` to source `~/.bashrc`. This way, the same configuration is applied regardless of the mode in which the shell is running.

```sh
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
```
