#!/bin/sh

# -----------------------------------------------------------------------------
# Script for committing experimental work.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

if [ -z "${1}" ]; then
  echo "Require commit message" >&2;
  exit 1;
fi;

git add --all && git commit --no-verify --message "experiment: ${1}";
