# Dotfiles

These are my personal dotfiles. They include handy aliases and functions for UNIX-like systems, a customized Bash prompt using the [oh-my-posh](https://ohmyposh.dev/) framework, a better default configuration for Git, and an extensive suite of useful Git aliases – things like `git sync`, `git amend`, `git squash`, `git fixup` and `git undo`.

Also bundled in this repository are binaries for command line utilities and I use often like Jesse Duffield's excellent [lazygit](https://github.com/jesseduffield/lazygit), and configurations for my principal software development tools like Visual Studio Code and Windows Terminal.

These dotfiles and configurations are tooled for my preferred computing environment: Windows desktop programs with terminal utilities like `git` running in a Linux emulator like Git Bash for Windows or a virtual machine like WSL2. Nevertheless, I've made some effort to make the shell scripts as cross-platform compatible as possible. Most of the scripts are POSIX-compliant and will therefore run in all UNIX shells. However, all the executable binaries shipped with this repository are for 64 bit Windows systems.

I maintain this repository for ease of backing up, syncing and porting my system configuration between computers. You are welcome to fork this repository and use it as a basis for designing your own dotfiles. Detailed documentation is included for installing, configuring and updating.

## Documentation

### Get started

- [Requirements](./docs/start/requirements.md)
- [Installation](./docs/start/installation.md)
- [Configuration](./docs/start/configuration.md)
- [Updating](./docs/start/updating.md)

### Usage

#### Shells

- [Shell startup scripts](./docs/usage/shells/startup-scripts.md)
- [Shell environment variables](./docs/usage/shells/environment-variables.md)
- [Shell aliases](./docs/usage/shells/aliases.md)
- [Shell functions](./docs/usage/shells/functions.md)

#### Git

- [Git config](./docs/usage/git/config.md)
- [Git aliases](./docs/usage/git/aliases.md)
- [Git tools](./docs/usage/git/tools.md)

#### Windows Terminal

- [Startup actions](./docs/usage/wt/startup-actions.md)

### Contributing

The following documentation is for maintainers and contributors of this project.

- [Dependencies](./docs/contributing/dependencies.md)
- [Filesystem](./docs/contributing/filesystem.md)
- [Acknowledgments](./docs/contributing/acknowledgments.md)

-----

Copyright © 2020-2023 Kieran Potts \
[MIT license](./LICENSE.txt)

The executable binaries redistributed via this repository are copyright their respective authors and may be subject to alternative free and open source software licenses.
