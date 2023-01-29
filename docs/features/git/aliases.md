# Git aliases

The following Git aliases provide shortcut commands for common source control operations. This table provides a short summary of each alias's API and behavior – see the inline code comments in `dotfiles/gitconfig` for more comprehensive documentation.

Note: A small subset of these aliases are implemented as shell scripts that are symlinked from your `~/bin` directory, and can therefore be executed directly, eg `git-feature`.

| Command                               | Description                                                                  |
|---------------------------------------|------------------------------------------------------------------------------|
| `git aliases`                         | List all configured aliases                                                  |
| `git amend`                           | Add all working changes to the last commit, including new (untracked) files  |
| `git attribute "[comment]"`           | Creates a commit with the message "attribute: [comment]"                     |
| `git br [branch_name]`                | Create a branch, switch to it, and push immediately to setup tracking        |
| `git branches`                        | List all branches by order of last commit                                    |
| `git cm (-m "[comment]")`             | Stage and commit all changes in the working tree, including new files        |
| `git changed [hash]`                  | List the files changed in a specific commit                                  |
| `git changes`                         | Lists files staged for committing                                            |
| `git cl`                              | Shortcut for `git clone`                                                     |
| `git co`                              | Shortcut for `git checkout`                                                  |
| `git configure`                       | Open the `~/.gitconfig` file in your default text editor                     |
| `git contrib`                         | List all contributors to the repository, ordered by their commit count       |
| `git current`                         | Show the name of the current branch                                          |
| `git default`                         | Fetches the name of the default branch, as configured in the "origin" repo   |
| `git delete [branch_name]`            | Deletes both the local and upstream versions of a branch, if it is merged    |
| `git delete-force [branch_name]`      | Deletes both the local and upstream versions of a branch, even if not merged |
| `git discard [file1] [file2]...`      | Discard working changes made to a particular file since the last commit      |
| `git down`                            | Maps to `git pull` with the rebasing integration strategy enabled            |
| `git download`                        | Downloads and prunes local objects, tags and branches to match all remotes   |
| `git experiment "[comment]"`          | Creates a commit with the message "experiment: [comment]"                    |
| `git feature "[comment]`              | Creates a commit with the message "feature: [comment]"                       |
| `git fell ([main_branch])`            | Delete all branches that have been merged with the default or give branch    |
| `git fetched`                         | List all new commits since the last update to HEAD                           |
| `git filelog [path/to/file]`          | List all the commits that have modified a specific file                      |
| `git fix "[comment]"`                 | Creates a commit with the message "fix: [comment]"                           |
| `git fixup ([sha])`                   | Fix something in the previous commit, or an earlier specified commit         |
| `git ff|fast-forward`                 | Do a fast-forward merge                                                      |
| `git graph`                           | Detailed graph view of `git log`                                             |
| `git history`                         | Cleaner `git log`                                                            |
| `git k`                               | Opens `gitk`, Git's built-in repository browser                              |
| `git last`                            | Show detailed information on the last commit                                 |
| `git maint "[comment]"`               | Creates a commit with the message "maintenance: [comment]"                   |
| `git orphan`                          | Create a new branch with no parents                                          |
| `git orphan-fresh`                    | Create a new branch with no parents, and remove all working changes          |
| `git pick`                            | Shortcut for `git cherry-pick`                                               |
| `git recent`                          | Equivalent to the `git history` alias but showing only the last 25 commits   |
| `git refactor "[comment]"`            | Creates a commit with the message "refactor: [comment]"                      |
| `git remotes`                         | List the URLs of all remotes                                                 |
| `git reword`                          | Change the message of the previous commit (adds staged files, too)           |
| `git state`                           | Short-format view of the working tree's current state                        |
| `git squash`                          | Perform a `merge --squash` operation                                         |
| `git staged`                          | Lists files staged for committing                                            |
| `git stashed`                         | Show the current number of entries in the stash                              |
| `git sw`                              | Shortcut for `git switch`                                                    |
| `git sync`                            | Sync the local and tracked upstream branches                                 |
| `git tags`                            | List all tags, sorted by commit date                                         |
| `git track`                           | Alias for `git add` and the opposite action of the `git untrack` alias       |
| `git tracking`                        | Same as `git branches` but shows tracked upstream branches, too              |
| `git unamend`                         | Undo the previous `git amend` operation                                      |
| `git uncommit`                        | Undoes the last commit, returns the changes to the staging index             |
| `git undo`                            | Undoes all working and staged changes since the last commit                  |
| `git unstage`                         | Alias for `git reset`, removes everything from the staging index             |
| `git untrack [path/to/file]`          | Untrack a file                                                               |
| `git up`                              | Maps to `git push`, pushing tags and setting up tracking too                 |
| `git up-force`                        | Force-push changes up to the remote, overwrite own work but not others       |
| `git upstream`                        | Show the name of the tracked upstream branch                                 |
| `git versions`                        | List tags prefixed with the lower case letter "v", sorted numerically        |
| `git wip ("[comment]")`               | Commits all working changes with the comment "WIP" or appending " - WIP"     |
