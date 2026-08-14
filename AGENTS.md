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

The following technical standards (TS) govern this project. Fetch and ingest
the relevant standards as-and-when required for the task at hand.

- [**TS-9: Version Control**](https://kieranpotts.com/standards/009) \
  Use when working with Git. Covers commits, branching, merging, integration
  strategies, cutting releases, and configuring Git/PR/CI tooling.

- [**TS-11: Versioning**](https://kieranpotts.com/standards/011) \
  Use when choosing a versioning scheme, formatting version strings, or tagging
  releases (SemVer, CalVer).

- [**TS-25: Technical Documentation**](https://kieranpotts.com/standards/025) \
  Use when deciding what documentation a project needs, where it should live,
  who it's for, or whether it's still trustworthy.

- [**TS-31: Unix Shells and POSIX Standards**](https://kieranpotts.com/standards/031) \
  Use when authoring or modifying shell scripts that must be POSIX-compliant
  and run across multiple shells (sh, bash, zsh, dash) and platforms.

- [**TS-32: Bash**](https://kieranpotts.com/standards/032) \
  Use when authoring or modifying scripts that target Bash specifically, and
  which use Bash extensions ("Bashisms").
