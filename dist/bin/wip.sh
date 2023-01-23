#!/bin/sh

# -----------------------------------------------------------------------------
# Script for quickly saving work-in-progress in a Git repository.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

git add --all && git commit --no-verify --message "${1:-WIP}${1+ - WIP}";
