# Changelog

## [Unreleased]

- Source `~/local.secrets`, if present, from `local.bashrc`, so credentials no
  longer need to be written inline in a world-readable file that shares its
  name with a tracked template.

- Create `~/local.secrets` from the installer, at mode 0600, re-asserting that
  mode on every run so permission drift is repaired. Ignore `*.secrets` in this
  repository as a backstop.

- Wrap `ollama` to run with `TERM=dumb`, suppressing the OSC 11 and cursor
  position probes that Ollama's vendored Charm TUI stack writes without
  draining the terminal's reply, which leaked escape sequences into the
  scrollback.

- Add guarded `PATH` entries to `local.bashrc` for LM Studio's `lms` CLI,
  OpenCode, a user-writable global npm prefix, and Rustup's `env` file.

- Add inshellisense autostart to `local.bashrc`, guarded on `$TMUX` being
  unset to avoid nesting its pseudo-terminal inside a tmux pane.

- Enable `DOCKER_CONTEXT=default` by default in `local.bashrc`, rather than
  shipping it commented out.

## [1.2.0] - 2026-08-12

- Add `tag.forceSignAnnotated` to local Git config.

- Remove alias overriding of `vi` and `vim` — broke in environments where
  neovim is not installed.

## [1.1.0] - 2026-08-10

- Set `DOCKER_CONTEXT` to always use "default" `docker` daemon socket,
  overriding Docker Desktop's separate socket.

- Set `format.pretty` in the global Git config, so `git log` defaults to a
  one-line summary with abbreviated hash, ref decorations, subject, date, and
  author.

## [1.0.0] - 2026-06-08

Initial versioned release.

- An opinionated Git configuration, with aliases, sensible diff/merge defaults,
  LFS support, and a commit message template.

- A collection of Bash aliases and functions for everyday navigation, file
  operations, Git, Docker, and Go.

- Bash startup scripts (`~/.profile`, `~/.bash_profile`, `~/.bashrc`) designed
  to work consistently across login and non-login shells.

- Prompt themes for [Oh-My-Posh](https://ohmyposh.dev/) and Bash, with Git
  status indicators.

- A `run/install` installer that symlinks the "global" dotfiles, copies editable
  "local" templates without clobbering, and backs up any existing system files
  on first install.

- GitHub Codespaces integration via an auto-discovered `install.sh` wrapper,
  installing a Codespaces-appropriate subset of the dotfiles.

- Cross-platform support, including native symlink handling under
  MSysGit / Git Bash on Windows.
