# Dotfiles

Kieran Potts' personal Unix dotfiles: Git configuration, Bash aliases and
functions, Bash startup scripts, and prompt themes for Oh-My-Posh and Bash.
Installed via a symlink/copy installer and auto-discovered by GitHub
Codespaces. Dotfiles releases are pinned by version in the
[docker-devcontainer](https://github.com/kieranpotts/docker-devcontainer)
image build.

The capitalized words REQUIRED, MUST, MUST NOT, RECOMMENDED, SHOULD,
SHOULD NOT, OPTIONAL, and MAY are to be interpreted as described in
[IETF RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Tech stack

- POSIX `sh` for the installer (`run/install`, `install.sh`).
- Bash for shell startup files and aliases/functions.
- Oh-My-Posh and a custom Bash prompt theme for the prompt.
- pre-commit for commit-message validation.

## Project structure

- **[dist/](./dist/)** \
  "Global" dotfiles, symlinked as-is into the user's home directory. Not
  intended to be edited by the installed user.

- **[home/](./home/)** \
  "Local" templates (`local.bashrc`, `local.bash_profile`, `local.profile`,
  `local.gitconfig`, `local.gitignore`, `local.gitmessage`,
  `.prompt-themes/`), copied into the home directory on first install and
  safe to edit thereafter.

- **[run/install](./run/install)** \
  The installer. Idempotent — safe to re-run after every `git pull`.

- **[install.sh](./install.sh)** \
  A thin wrapper delegating to `run/install`, kept at the repo root solely so
  GitHub Codespaces' dotfiles auto-discovery finds it. Prefer
  `./run/install` directly for manual use.

- **[docs/](./docs/)** \
  [Overview](./docs/overview.md), [requirements](./docs/requirements.md),
  [installation](./docs/installation.md),
  [configuration](./docs/configuration.md), [usage](./docs/usage.md), and
  [releasing](./docs/releasing.md) docs.

- **[CHANGELOG.md](./CHANGELOG.md)** \
  Release history.

## Tools

- `./run/install` \
  Installs/re-installs the dotfiles into the user's home directory. Safe to
  run multiple times.

## Rules

- MUST keep `run/install` idempotent. It is documented as safe to re-run
  after every `git pull`.

- MUST NOT edit files under `dist/` expecting per-user customization. Use
  `home/` for anything meant to be locally editable after install.

- SHOULD update `docs/` alongside any change to installed behavior, since
  `docs/` is the only place installation/configuration/usage is documented.

## References

This project follows Kieran Potts' technical standards. Read the relevant
standard(s) below for the current task. Their RFC 2119 rules MUST be followed
unless explicitly overridden elsewhere in this file.

- **[TS-9: Version Control](https://kieranpotts.com/standards/009)**
- **[TS-11: Versioning](https://kieranpotts.com/standards/011)**
- **[TS-25: Technical Documentation](https://kieranpotts.com/standards/025)**
- **[TS-31: Unix Shells and POSIX Standards](https://kieranpotts.com/standards/031)**
- **[TS-32: Bash](https://kieranpotts.com/standards/032)**
