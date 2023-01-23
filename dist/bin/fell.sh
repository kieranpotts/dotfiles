#!/bin/sh

# -----------------------------------------------------------------------------
# Script to delete any local branches that have been merged into the default
# branch, or that have been merged into another specified mainline branch.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

# Get default branch (see `default` Git alias).
git remote set-head origin --auto > /dev/null
DEFAULT=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

git branch --merged ${1-$DEFAULT} | grep --invert-match " ${1-$DEFAULT}$" | xargs git branch --delete 2> /dev/null
