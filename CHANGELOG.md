# Change log

## Unreleased

- Add modified Agnoster prompt theme via Oh My Posh
- Add `~/.profile` for all POSIX-compliant shells
- Add `~/.bash_profile` and `~/.bashrc` startup scripts for Bash sessions
- Allow shell configuration overrides via `~/local.profile`, `~/local.bash_profile`, `~/local.bashrc`
- Add `cd` aliases `..`, `...`, `....` and `.....`
- Add `g` alias for `git`
- Colorize `grep` output by default
- Add `l`, `lf` and `ld` aliases for `ls`, and colorize output by default
- Make `mkdir` recursive by default
- Add `s` alias for `sudo`
- Add Git aliases `aliases`, `amend`, `attribute`, `br`, `branches`, `cm`, `changed`, `changes`, `cl`, `co`, `configure`, `contrib`, `current`, `default`, `delete`, `delete-force`, `discard`, `down`, `download`, `experiment`, `feature`, `fell`, `fetched`, `filelog`, `file-history`, `fix`, `fixup`, `fast-forward`|`ff`, `graph`, `history`, `k`, `last`, `maint`, `orphan`, `orphan-fresh`, `pick`, `recent`, `refactor`, `remotes`, `reword`, `state`, `squash`, `staged`, `stashed`, `sw`, `sync`, `tags`, `track`, `tracking`, `unamend`, `uncommit`, `undo`, `unstage`, `untrack`, `up`, `up-force`, `upstream`, `versions` and `wip`
- Allow Git configuration overrides via (`~/local.gitconfig`)
- Add global Git excludes file (`~/local.gitignore`)
- Record explicit merges by default (`--no-ff`)
- Automatically prune refs to non-existent upstream branches and tags on `git fetch`
- Rebase by default on `git pull`
- Push tags by default with `git push`
- Automatically setup remote branch tracking
- Tracks branches of the same name by default
- Apply `--autosquash` rules automatically on rebase operations
- Opt-out of security checks for Git repositories on external storage (`safe.directory`)
