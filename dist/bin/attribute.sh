#!/bin/sh

# -----------------------------------------------------------------------------
# Script for committing implementations of non-functional requirements or
# otherwise improving non-quality attributes such as performance and security.
#
# See `~/.gitconfig` for usage instructions.
# -----------------------------------------------------------------------------

if [ -z "${1}" ]; then
  echo "Require commit message" >&2
  exit 1
fi

git add --all && git commit --no-verify --message "attribute: ${1}"
