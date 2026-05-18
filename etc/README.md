# The `etc` directory

The `etc` directory contains configuration files for various utility programs for Unix-like systems. The installer creates symlinks from the standard locations these programs expect to the files in this directory.

Contents:

- [`lazygit/config.yml`](./lazygit/config.yml): Configuration for [LazyGit](https://github.com/jesseduffield/lazygit). Symlinked to `~/.config/lazygit/config.yml`.

- [`nvim/init.vim`](./nvim/init.vim): Configuration for [Neovim](https://neovim.io/). Symlinked to `~/.config/nvim/init.vim`.

- [`tmux/tmux.conf`](./tmux/tmux.conf): Configuration for [tmux](https://github.com/tmux/tmux). Symlinked to `~/.tmux.conf`.

- [`tmux/inc/dev`](./tmux/inc/dev): A tmux layout script that can be loaded with `Ctrl-b D`. Symlinked to `~/.tmux/dev`.

On non-Windows environments, the [installer](../run/install) creates these symlinks automatically. On Git Bash for Windows, symlinks must be created manually via PowerShell – see [docs/installation.md](../docs/installation.md#create-symlinks-to-the-configuration-files) for the commands.
