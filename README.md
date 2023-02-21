# Dotfiles

**A baseline, extensible user profile configuration for UNIX-like systems (including Git Bash for Windows).**

Features include:

- Better Git defaults
- Extensive suite of useful Git aliases including `git sync`, `git amend`, `git squash`, `git fixup` and `git undo`
- Global `.gitignore` file
- Customized Bash prompt
- Handy UNIX aliases
- Windows Terminal settings

These dotfiles also ship with a couple of TUI utilities:

- Jesse Duffield's [lazygit](https://github.com/jesseduffield/lazygit), a terminal UI for Git repositories with lots of [hidden features](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md)
- [oh-my-posh](https://ohmyposh.dev/), a theme framework for the prompt line of any shell

(Only Windows binaries are included at this time.)

## Documentation

### Getting started

- [Requirements](./docs/requirements.md)
- [Installation](./docs/installation.md)
- [Configuration](./docs/configuration.md)

### Features

#### Shells

- [Shell startup scripts](./docs/features/shells/startup-scripts.md)
- [Shell environment variables](./docs/features/shells/environment-variables.md)
- [Shell aliases](./docs/features/shells/aliases.md)
- [Shell functions](./docs/features/shells/functions.md)

#### Git

- [Git config](./docs/features/git/config.md)
- [Git aliases](./docs/features/git/aliases.md)
- [Git tools](./docs/features/git/tools.md)

### Contributing

The following documentation is for maintainers and contributors of this project:

- [Dependencies](./docs/contributing/dependencies.md)
- [Filesystem](./docs/contributing/filesystem.md)
- [Acknowledgments](./docs/contributing/acknowledgments.md)

-----

Copyright © 2020-2023 Kieran Potts \
[MIT license](./LICENSE.txt)
