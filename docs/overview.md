# Overview

This project captures my personal Unix dotfiles.

The following is included:

- A better default configuration for Git, including aliases, diff/merge algorithms, and LFS support.

- A collection of Bash shell aliases and functions for everyday navigation, file operations, Git, Docker, and Go.

- Bash startup scripts (`~/.profile`, `~/.bash_profile`, `~/.bashrc`) designed to work consistently across login and non-login shells.

- Prompt themes for [Oh-My-Posh](https://ohmyposh.dev/) and Bash, with Git status indicators.

- GitHub Codespaces integration via an auto-discovered installer.

The repository's contents are organized into the following directories:

- `dist/`: "Global" dotfiles that are symlinked into the user's home directory. Not intended to be edited.
- `home/`: "Local" templates that are copied into the user's home directory on first install. Safe to edit thereafter.
- `run/`: The installer script. A thin `install.sh` wrapper at the repo root exists for GitHub Codespaces auto-discovery.
- `docs/`: Documentation.
