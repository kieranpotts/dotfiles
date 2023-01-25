#!/bin/sh

# -----------------------------------------------------------------------------
# Script for committing bug fixes.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

if [ -z "${1}" ]; then
  echo "Require commit message" >&2
  exit 1
fi

git add --all && git commit --quiet --message "fix: ${1}"
