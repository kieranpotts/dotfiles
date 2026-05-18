# The `dist` directory

The `dist` directory contains "global" dotfiles that are intended to be symlinked from the user's home directory. These are not intended to be editable by the user. Instead, the user is able to extend the "global" dotfiles via "local" ones.

## Shell startup scripts

A shell environment can be interactive or non-interactive:

- An **interactive shell** reads and writes to a user's terminal and may operate in login or non-login mode.
- An **interactive login shell** is typically spawned when a user enters a remote shell environment via SSH.
- Temporary **interactive non-login shells** are used to run scripts from the terminal and are invoked by the `sh` command (or `bash` etc).
- A **non-interactive shell** is not associated with a user interface (terminal).

Various scripts are automatically executed by shells at startup. Which scripts are executed depends on the mode in which the shell is running.

Interactive login shells look for a file called `/etc/profile` and, if the file exists and is readable, executes the script's commands. Then the same happens for the user-level `~/.profile` file. These scripts are loaded automatically by all Unix shells – Bash, Fish, Zsh, etc – at startup of a new _interactive login_ session.

Different shells extend the standard startup behaviors with their own proprietary conventions. For example, Bash will attempt to execute `~/.bash_profile`, `~/.bash_login` or `~/.profile` – the first one it finds, in that order – when started in interactive login mode. The `~/.bash_profile` file, if it exists, takes precedence over `~/.profile`. In addition, Bash reads a file called `~/.bashrc` ("Bash run command"), if it exists, whenever a new Bash shell is spawned, regardless of the mode in which the shell is running.

As a general rule, `~/.bash_profile` should be used to set environment variables and to run commands that need to be run only once per login session, while `~/.bashrc` should be used to do things every time Bash is run, regardless of the mode in which it operates. The `~/.bashrc` file is a good place to define aliases and functions, and to customize the prompt and history.

However, when it comes to _local_ shell environments, confusingly different terminal programs launch them differently. Windows Terminal, for example, runs local shell environments in interactive login mode by default. But other terminals spawn startup local shell environment in non-login mode by default.

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
