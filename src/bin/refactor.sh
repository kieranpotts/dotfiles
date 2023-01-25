#!/bin/sh

# -----------------------------------------------------------------------------
# Script for committing refactoring work.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

if [ -z "${1}" ]; then
  echo "Require commit message" >&2;
  exit 1;
fi;

git add --all && git commit --quiet --message "refactor: ${1}";
