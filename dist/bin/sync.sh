#!/bin/sh

# -----------------------------------------------------------------------------
# Script for syncing the current checked out Git branch with the branch it
# tracks in the upstream "origin" repository.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

initialStashCount=$(git rev-list --walk-reflogs --count refs/stash 2> /dev/null);
git stash push --include-untracked;

upstreamBranch=$(git upstream);
if [ ! -z "$upstreamBranch" ]; then
  git pull --rebase --prune;
  git push --follow-tags;
else
  git push --set-upstream origin HEAD --follow-tags;
fi;

newStashCount=$(git rev-list --walk-reflogs --count refs/stash 2> /dev/null);
if [ "${newStashCount:-0}" != "${initialStashCount:-0}" ]; then
  git stash pop;
fi;
