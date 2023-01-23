#!/bin/sh

# -----------------------------------------------------------------------------
# Script for getting the name of the default branch in the upstream repository.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

git remote set-head origin --auto > /dev/null
git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
